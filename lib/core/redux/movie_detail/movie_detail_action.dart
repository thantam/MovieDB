import 'package:flutterasyncredux/core/models/movie.dart';

class InitMovieDetail{
  final Movie movie;
  InitMovieDetail(this.movie);
}
class LoadingMovieDetail {
  final Movie movie;
  LoadingMovieDetail(this.movie);
}

class ReceivedMovieDetail{
  final Movie movie;
  ReceivedMovieDetail(this.movie);
}

class ReceivedErrorLoadMovieDetail{
}