import 'package:flutter/cupertino.dart';
import 'package:flutterasyncredux/core/redux/movie_detail/movie_detail_state.dart';
import 'package:flutterasyncredux/core/redux/movies/movie_state.dart';

class AppState {
  AppState({
    @required this.moviesState,
    @required this.movieDetail,
  });

  final MoviesState moviesState;
  final MovieDetailState movieDetail;

  factory AppState.inital(){
    return AppState(
      moviesState: MoviesState.initial(),
      movieDetail: MovieDetailState.initial(),
    );
  }


  AppState copyWith({
    MoviesState moviesState,
    MovieDetailState movieDetailState,
  }){
    return AppState(
      moviesState: moviesState ?? this.moviesState,
      movieDetail: movieDetailState ?? this.movieDetail,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              moviesState == other.moviesState &&
              movieDetail == other.movieDetail;

  @override
  int get hashCode =>
      moviesState.hashCode ^
      movieDetail.hashCode;

}