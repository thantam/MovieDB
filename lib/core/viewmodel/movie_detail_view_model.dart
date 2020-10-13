import 'package:flutterasyncredux/core/models/loading_status.dart';
import 'package:flutterasyncredux/core/models/movie.dart';
import 'package:flutterasyncredux/core/redux/app/app_state.dart';
import 'package:redux/redux.dart';

class MovieDetailViewModel {
  final LoadingStatus loadingDetailStatus;
  final Movie movieDetail;

  MovieDetailViewModel(this.loadingDetailStatus, this.movieDetail);

  static MovieDetailViewModel fromStore (Store<AppState> store){
    return MovieDetailViewModel(store.state.movieDetail.loadingMovieDetailStatus, store.state.movieDetail.movie);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MovieDetailViewModel &&
              runtimeType == other.runtimeType &&
              loadingDetailStatus == other.loadingDetailStatus &&
              movieDetail == other.movieDetail;

  @override
  int get hashCode =>
      loadingDetailStatus.hashCode ^
      movieDetail.hashCode;



}