import 'package:flutter/material.dart';
import 'package:flutterasyncredux/core/models/movies_list_type.dart';
import 'package:flutterasyncredux/core/models/loading_status.dart';
import 'package:flutterasyncredux/core/models/movie.dart';
import 'package:flutterasyncredux/core/redux/app/app_state.dart';
import 'package:flutterasyncredux/core/redux/movies/movie_selectors.dart';
import 'package:redux/redux.dart';

class MoviesPageViewModel {
  final LoadingStatus status;
  final List<Movie> movies;
  final Function refeshEvents;

  MoviesPageViewModel({
    @required this.status,
    @required this.movies,
    @required this.refeshEvents
  });

  static MoviesPageViewModel fromStore(
    Store<AppState> store,
    MoviesListType type,
  ){
    return MoviesPageViewModel(
        status: type == MoviesListType.popularMovies
            ? store.state.moviesState.loadPopularMoviesStatus
            : store.state.moviesState.comingMoviesStatus,
        movies: type == MoviesListType.popularMovies
            ? popularMoviesSelector(store.state)
            : comingMoviesSelector(store.state),
        refeshEvents: null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MoviesPageViewModel &&
              runtimeType == other.runtimeType &&
              status == other.status &&
              movies == other.movies;

  @override
  int get hashCode =>
      status.hashCode ^
      movies.hashCode;



}