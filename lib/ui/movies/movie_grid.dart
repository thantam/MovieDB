import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterasyncredux/core/models/movies_list_type.dart';
import 'package:flutterasyncredux/core/models/movie.dart';
import 'package:flutterasyncredux/ui/common/info_message_view.dart';
import 'package:flutterasyncredux/ui/movie_details/movie_detail_page.dart';

import 'movie_grid_item.dart';

class MovieGrid extends StatelessWidget {
  static const emptyViewKey = const Key('emptyView');
  static const contentKey = const Key('content');

  MovieGrid({
    @required this.listType,
    @required this.movies,
    @required this.onReloadCallback,
  });

  final MoviesListType listType;
  final List<Movie> movies;
  final VoidCallback onReloadCallback;

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return InfoMessageView(
        key: emptyViewKey,
        title: 'All empty!',
        description: 'Didn\'t find any movies at\nall.',
        onActionButtonTapped: onReloadCallback,
      );
    }

    return _Content(movies, listType);
  }
}

class _Content extends StatelessWidget {
  _Content(this.movies, this.listType);
  final List<Movie> movies;
  final MoviesListType listType;

  Widget _buildItem(BuildContext context, int index) {
    final movie = movies[index];

    return MovieGridItem(
      movie: movie,
      onTapped: () => _openMovieDetails(context, movie),
      showReleaseDateInformation: listType == MoviesListType.comingSoon,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final crossAxisChildCount = isPortrait ? 2 : 4;

    return Container(
      key: MovieGrid.contentKey,
      child: Scrollbar(
        child: GridView.builder(
          padding: const EdgeInsets.only(bottom: 50.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisChildCount,
            childAspectRatio: 2 / 3,
          ),
          itemCount: movies.length,
          itemBuilder: _buildItem,
        ),
      ),
    );
  }

  void _openMovieDetails(BuildContext context, Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MovieDetailsPage(movie),
      ),
    );
  }
}
