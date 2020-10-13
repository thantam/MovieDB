import 'package:flutterasyncredux/core/models/movies_list_type.dart';
import 'package:flutterasyncredux/core/models/loading_status.dart';

import 'movie_actions.dart';
import 'movie_state.dart';

MoviesState moviesReducer(MoviesState state, dynamic action) {
  if(action is RequestingMoviesAction){
    return _requestingMovies(state, action.type);
  }else if(action is ReceivedPopularMoviesAction) {
    return state.copyWith(
      loadPopularMoviesStatus: LoadingStatus.success,
      popularMovies: action.movies,
    );
  } else if (action is ReceivedComingMoviesAction) {
    return state.copyWith(
      comingMoviesStatus: LoadingStatus.success,
      comingMovies: action.movies,
    );
  } else if (action is ErrorLoadingMoviesAction) {
    return _errorLoadingEvents(state, action.type);
  }
  return state;
}

MoviesState _errorLoadingEvents(MoviesState state, MoviesListType type) {
  final status = LoadingStatus.error;

  if (type == MoviesListType.popularMovies) {
    return state.copyWith(loadPopularMoviesStatus: status);
  }

  return state.copyWith(comingMoviesStatus: status);
}

MoviesState _requestingMovies(MoviesState state, MoviesListType type) {
  final status = LoadingStatus.loading;

  if (type == MoviesListType.popularMovies) {
    return state.copyWith(loadPopularMoviesStatus: status);
  }

  return state.copyWith(comingMoviesStatus: status);
}