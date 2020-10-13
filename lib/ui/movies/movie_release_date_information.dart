import 'package:flutterasyncredux/core/models/movie.dart';
import 'package:flutter/material.dart';

class MovieReleaseDateInformation extends StatelessWidget {

  MovieReleaseDateInformation(this.movie);
  final Movie movie;

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.only(
        top: 5.0,
        right: 20.0,
        bottom: 5.0,
        left: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Release date',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2.0),
          Text(
            movie.releaseDate,
            style: const TextStyle(
              color: const Color(0xFFFEFEFE),
              fontWeight: FontWeight.w300,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
