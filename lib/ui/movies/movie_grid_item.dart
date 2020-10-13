import 'package:flutter/material.dart';
import 'package:flutterasyncredux/core/models/movie.dart';

import 'movie_poster.dart';
import 'movie_release_date_information.dart';

class MovieGridItem extends StatelessWidget{

  MovieGridItem({
    @required this.movie,
    @required this.onTapped,
    @required this.showReleaseDateInformation,
  });

  final Movie movie;
  final VoidCallback onTapped;
  final bool showReleaseDateInformation;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white),
      child: Stack(
        fit: StackFit.expand,
        children: [
          MoviePoster(movie: movie),
          _TextualInfo(movie),
          Positioned(
            top: 10.0,
            child: Visibility(
              visible: showReleaseDateInformation,
              child: MovieReleaseDateInformation(movie),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTapped,
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }

}

class _TextualInfo extends StatelessWidget {
  _TextualInfo(this.movie);
  final Movie movie;

  BoxDecoration _buildGradientBackground() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: [0.0, 0.7, 0.7],
        colors: [
          Colors.black,
          Colors.transparent,
          Colors.transparent,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildGradientBackground(),
      padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      child: _TextualInfoContent(movie),
    );
  }
}

class _TextualInfoContent extends StatelessWidget {
  _TextualInfoContent(this.movie);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          movie.releaseDate,
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
