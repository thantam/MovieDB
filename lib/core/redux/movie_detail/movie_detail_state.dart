
import 'package:flutter/material.dart';
import 'package:flutterasyncredux/core/models/loading_status.dart';
import 'package:flutterasyncredux/core/models/movie.dart';

class MovieDetailState {
  final Movie movie;
  final LoadingStatus loadingMovieDetailStatus;

  MovieDetailState({
    @required this.movie,
    @required this.loadingMovieDetailStatus
  });

  factory MovieDetailState.initial() {
    return MovieDetailState(
        movie: new Movie(),
        loadingMovieDetailStatus: LoadingStatus.loading);
  }

  MovieDetailState copyWith(Movie movie, LoadingStatus status){
    return MovieDetailState(
        movie: movie ?? this.movie,
        loadingMovieDetailStatus: status ?? this.loadingMovieDetailStatus);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MovieDetailState &&
              runtimeType == other.runtimeType &&
              movie == other.movie &&
              loadingMovieDetailStatus == other.loadingMovieDetailStatus;

  @override
  int get hashCode =>
      movie.hashCode ^
      loadingMovieDetailStatus.hashCode;



}
