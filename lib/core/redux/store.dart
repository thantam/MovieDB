import 'package:flutterasyncredux/core/network/finnkino_api.dart';
import 'package:flutterasyncredux/core/redux/app/app_reducer.dart';
import 'package:flutterasyncredux/core/redux/movie_detail/movie_detail_middleware.dart';
import 'package:key_value_store/key_value_store.dart';
import 'package:redux/redux.dart';

import 'app/app_state.dart';
import 'movies/movie_middleware.dart';

Store<AppState> createStore(){
  final api = MovieDBApi();

  return Store(
    appReducer,
    initialState: AppState.inital(),
    distinct: true,
    middleware: [
      MoviesMiddleware(api),
      MovieDetailMiddleware(api),
    ],
  );
}