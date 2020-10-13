import 'package:flutterasyncredux/core/models/movie.dart';
import 'package:flutterasyncredux/core/redux/app/app_state.dart';

// where to select data by particular purpose from Store like: filter, map, sort, ...

List<Movie> popularMoviesSelector(AppState state) => state.moviesState.popularMovies;

List<Movie> comingMoviesSelector(AppState state) => state.moviesState.comingMovies;
