import 'package:flutterasyncredux/core/models/movies_list_type.dart';
import 'package:flutterasyncredux/core/models/movie.dart';

class RefreshEventsAction {
  RefreshEventsAction(this.type);
  final MoviesListType type;
}

class RequestingMoviesAction {
  RequestingMoviesAction(this.type);
  final MoviesListType type;
}

class ReceivedPopularMoviesAction {
  ReceivedPopularMoviesAction(this.movies);
  final List<Movie> movies;
}

class ErrorLoadingMoviesAction {
  ErrorLoadingMoviesAction(this.type);
  final MoviesListType type;
}

class ReceivedComingMoviesAction {
  ReceivedComingMoviesAction(this.movies);
  final List<Movie> movies;
}

