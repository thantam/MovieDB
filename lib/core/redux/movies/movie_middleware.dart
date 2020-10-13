import 'package:flutterasyncredux/core/models/movies_list_type.dart';
import 'package:flutterasyncredux/core/models/loading_status.dart';
import 'package:flutterasyncredux/core/network/finnkino_api.dart';
import 'package:flutterasyncredux/core/redux/app/app_state.dart';
import 'package:flutterasyncredux/core/redux/common/common_actions.dart';
import 'package:redux/redux.dart';

import 'movie_actions.dart';

class MoviesMiddleware extends MiddlewareClass<AppState> {

  MoviesMiddleware(this.api);
  final MovieDBApi api;

  @override
  Future<void> call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    if(action is InitAction) {
      if(action.listType == MoviesListType.popularMovies){
        await _fetchPopularMovie(next);
      }else{
        await _fetchComingMovies(next);
      }

    } else if (action is RefreshEventsAction) {
      await _refreshEvents( action, next);
    }
  }

  Future<void> _fetchComingMovies(NextDispatcher next) async {
    next(RequestingMoviesAction(MoviesListType.comingSoon));
    try {
      final comingSoonEvents = await api.getUpcomingEvents();
      next(ReceivedComingMoviesAction(comingSoonEvents));
    } catch (e) {
      next(ErrorLoadingMoviesAction(MoviesListType.comingSoon));
    }
  }

  Future<void> _refreshEvents(RefreshEventsAction action, NextDispatcher next) {
    if (action.type == MoviesListType.popularMovies) {
      return _fetchPopularMovie(next);
    } else {
      return _fetchComingMovies(next);
    }
  }

  Future<void> _fetchPopularMovie(NextDispatcher next) async {
      next(RequestingMoviesAction(MoviesListType.popularMovies));
      try {
        final movies = await api.getPopularMovies();
        next(ReceivedPopularMoviesAction(movies));
      } catch (e) {
        next(ErrorLoadingMoviesAction(MoviesListType.popularMovies));
      }
  }
}
