import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterasyncredux/core/models/movie.dart';
import 'package:flutterasyncredux/core/redux/app/app_state.dart';
import 'package:flutterasyncredux/core/redux/movie_detail/movie_detail_action.dart';
import 'package:flutterasyncredux/core/viewmodel/movie_detail_view_model.dart';
import 'package:flutterasyncredux/ui/movies/movie_poster.dart';

import '../../assets.dart';
import 'actor_scroller.dart';
import 'movie_backdrop_photo.dart';
import 'movie_details_scroll_effects.dart';

class MovieDetailsPage extends StatefulWidget{

  final Movie movie;


  MovieDetailsPage(this.movie);

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();

}

class _BackButton extends StatelessWidget {
  _BackButton(this.scrollEffects);
  final MovieDetailsScrollEffects scrollEffects;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top,
      left: 4.0,
      child: IgnorePointer(
        ignoring: scrollEffects.backButtonOpacity == 0.0,
        child: Material(
          type: MaterialType.circle,
          color: Colors.transparent,
          child: BackButton(
            color: Colors.white.withOpacity(
              scrollEffects.backButtonOpacity * 0.9,
            ),
          ),
        ),
      ),
    );
  }
}

class _EventDetailsPageState extends State<MovieDetailsPage> {

  ScrollController _scrollController;
  MovieDetailsScrollEffects _scrollEffects;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _scrollEffects = MovieDetailsScrollEffects();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {


    final backgroundImage = Positioned.fill(
      child: Image.asset(
        ImageAssets.backgroundImage,
        fit: BoxFit.cover,
      ),
    );



    return StoreConnector<AppState, MovieDetailViewModel>(
      distinct: true,
      onInit: (store) => store.dispatch(LoadingMovieDetail(widget.movie)),
      converter: (store) => MovieDetailViewModel.fromStore(store),
      builder: (_, viewModel) {
        final content = <Widget>[_Header(viewModel.movieDetail),];
        addIfNonNull(_buildSynopsis(viewModel.movieDetail), content);
        addIfNonNull(_buildActorScroller(viewModel.movieDetail), content);

        final slivers = CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverList(delegate: SliverChildListDelegate(content)),
          ],
        );
        return Scaffold(
          backgroundColor: const Color(0xFFF0F0F0),
          body: Stack(
            children: [
              backgroundImage,
              _buildEventBackdrop(),
              slivers,
              _BackButton(_scrollEffects),
              _buildStatusBarBackground(),
            ],
          ),
        );
      }
    );


  }

  Widget _buildSynopsis(Movie movie) {
      return Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          top: 10.0,
          bottom: 16.0,
          left: 8.0,
          right: 8.0
        ),
        child: Text(movie.overview)
      );

    return null;
  }

  Widget _buildActorScroller(Movie movie) =>
      movie.actors != null ? ActorScroller(movie) : null;

  void addIfNonNull(Widget widget, List<Widget> children) {
    if (widget != null) {
      children.add(widget);
    }
  }

  Widget _buildEventBackdrop() {
    return Positioned(
      top: _scrollEffects.headerOffset,
      child: MovieBackdropPhoto(
        movie: widget.movie,
        scrollEffects: _scrollEffects,
      ),
    );
  }

  Widget _buildStatusBarBackground() {
    final statusBarColor = Theme.of(context).primaryColor;

    return Container(
      height: _scrollEffects.statusBarHeight,
      color: statusBarColor,
    );
  }

  void _scrollListener() {
    setState(() {
      _scrollEffects.updateScrollOffset(context, _scrollController.offset);
    });
  }

}

class _Header extends StatelessWidget {
  _Header(this.movie);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final moviePoster = Padding(
      padding: const EdgeInsets.all(6.0),
      child: MoviePoster(
        movie: movie,
        size: const Size(125.0, 197.5),
        displayPlayButton: true,
      ),
    );

    return Stack(
      children: [
        // Transparent container that makes the space for the backdrop photo.
        Container(
          height: 225.0,
          margin: const EdgeInsets.only(bottom: 132.0),
        ),
        // Makes for the white background in poster and movie information.
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            color: Colors.white,
            height: 132.0,
          ),
        ),
        Positioned(
          left: 10.0,
          bottom: 0.0,
          child: moviePoster,
        ),
        Positioned(
          top: 238.0,
          left: 156.0,
          right: 16.0,
          child: _MovieInfo(movie),
        ),
      ],
    );
  }
}

class _MovieInfo extends StatelessWidget {
  _MovieInfo(this.movie);
  final Movie movie;

  List<Widget> _buildTitleAndLengthInMinutes() {
    final length = '${movie.runtime} min';
    final genres = movie.genres.split(', ').take(4).join(', ');

    return [
      Text(
        movie.title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      const SizedBox(height: 8.0),
      Text(
        '$length | $genres',
        style: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final content = <Widget>[]..addAll(
      _buildTitleAndLengthInMinutes(),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: content,
    );
  }
}