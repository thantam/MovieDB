import 'package:flutterasyncredux/core/redux/app/app_state.dart';
import 'package:flutterasyncredux/core/redux/movie_detail/movie_detail_reducer.dart';
import 'package:flutterasyncredux/core/redux/movies/movie_reducer.dart';

AppState appReducer(AppState appState, dynamic action){
  print("Monica appReducer: $action");
  return new AppState(
      moviesState: moviesReducer(appState.moviesState, action),
      movieDetail: movieDetailReducer(appState.movieDetail, action));
}