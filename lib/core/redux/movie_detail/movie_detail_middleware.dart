import 'package:flutter/material.dart';
import 'package:flutterasyncredux/core/models/movie.dart';
import 'package:flutterasyncredux/core/network/finnkino_api.dart';
import 'package:flutterasyncredux/core/redux/movie_detail/movie_detail_action.dart';
import 'package:redux/redux.dart';

class MovieDetailMiddleware extends MiddlewareClass{
  final MovieDBApi api;

  MovieDetailMiddleware(this.api);

  @override
  call(Store store, dynamic action, NextDispatcher next) {
    print("Monica MovieDetailMiddleware: $action");
    if(action is LoadingMovieDetail){
      _getMovieDetail(action.movie, next);
    }
    next(action);
  }

  Future<Null> _getMovieDetail(Movie movie, NextDispatcher next) async {
    try{
      next(InitMovieDetail(movie));
      var movieDetail = await api.getMovieDetail(movie);
      next(ReceivedMovieDetail(movieDetail));
    }catch(e){
      next(ReceivedErrorLoadMovieDetail());
    }

  }

}