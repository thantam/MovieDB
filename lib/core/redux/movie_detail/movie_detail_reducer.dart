import 'package:flutterasyncredux/core/models/loading_status.dart';
import 'package:flutterasyncredux/core/redux/movie_detail/movie_detail_action.dart';
import 'package:flutterasyncredux/core/redux/movie_detail/movie_detail_state.dart';

MovieDetailState movieDetailReducer (MovieDetailState movieDetailState, dynamic action){
  print("Monica movieDetailReducer: $action");
  if(action is InitMovieDetail){
    return movieDetailState.copyWith(action.movie, LoadingStatus.loading);
  }if(action is ReceivedMovieDetail){
    return movieDetailState.copyWith(action.movie, LoadingStatus.success);
  }else if(action is ReceivedErrorLoadMovieDetail){
    return movieDetailState.copyWith(null, LoadingStatus.error);
  }
  return movieDetailState;
}