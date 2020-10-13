import 'package:flutter/material.dart';
import 'package:flutterasyncredux/core/models/loading_status.dart';
import 'package:flutterasyncredux/core/models/movie.dart';


class MoviesState {
  MoviesState({
    @required this.loadPopularMoviesStatus,
    @required this.popularMovies,
    @required this.comingMoviesStatus,
    @required this.comingMovies,
  });

  final LoadingStatus loadPopularMoviesStatus;
  final List<Movie> popularMovies;
  final LoadingStatus comingMoviesStatus;
  final List<Movie> comingMovies;

  factory MoviesState.initial (){
    return MoviesState(
      loadPopularMoviesStatus: LoadingStatus.idle,
      popularMovies: List(),
      comingMoviesStatus: LoadingStatus.idle,
      comingMovies: List(),
    );
  }
  MoviesState copyWith({
    LoadingStatus loadPopularMoviesStatus,
    List<Movie> popularMovies,
    LoadingStatus comingMoviesStatus,
    List<Movie> comingMovies,
  }) {
    return MoviesState(
      loadPopularMoviesStatus: loadPopularMoviesStatus ?? this.loadPopularMoviesStatus,
      comingMoviesStatus: comingMoviesStatus ?? this.comingMoviesStatus,
      popularMovies: popularMovies ?? this.popularMovies,
      comingMovies: comingMovies ?? this.comingMovies,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MoviesState &&
              runtimeType == other.runtimeType &&
              loadPopularMoviesStatus == other.loadPopularMoviesStatus &&
              comingMoviesStatus == other.comingMoviesStatus &&
              popularMovies == other.popularMovies &&
              comingMovies == other.comingMovies;

  @override
  int get hashCode =>
      loadPopularMoviesStatus.hashCode ^
      comingMoviesStatus.hashCode ^
      popularMovies.hashCode ^
      comingMovies.hashCode;

}
