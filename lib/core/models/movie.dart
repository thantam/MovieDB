
import 'package:flutterasyncredux/core/models/actor.dart';

class Movie {
  int id;
  var voteAverage;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  int runtime;
  List<Actor> actors;
  String genres;
  Movie(
      {this.id,
      this.voteAverage,
      this.title,
      this.posterPath,
      this.overview,
      this.releaseDate,
      this.runtime,
      this.genres,
      this.backdropPath,
      this.actors});
  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voteAverage = json['vote_average'];
    title = json['title'];
    posterPath = json['poster_path'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    backdropPath = json['backdrop_path'];
    runtime = json['runtime'];
    genres = '';

    if (json['genres'] != null) {
      json['genres'].forEach((v) {
        genres = genres + ' ' + v['name'];
      });
    }
    if(json['credits'] != null){
      var cast = json['credits'];
      actors = new List();
      cast['cast'].forEach((v) {
        actors.add(new Actor.fromJson(v));
      });
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          voteAverage == other.voteAverage &&
          title == other.title &&
          posterPath == other.posterPath &&
          overview == other.overview &&
          releaseDate == other.releaseDate;

  @override
  int get hashCode =>
      id.hashCode ^
      voteAverage.hashCode ^
      title.hashCode ^
      posterPath.hashCode ^
      overview.hashCode ^
      releaseDate.hashCode;

  @override
  String toString() {
    return 'Movie{id: $id, title: $title, runtime: $runtime, genres: $genres}';
  }


}