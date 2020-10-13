
import 'movie.dart';

class MovieResponse {
  int totalResults;
  List<Movie> results;
  int totalPages;
  int page;

  MovieResponse({this.page, this.totalResults, this.totalPages, this.results});

  MovieResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = new List<Movie>();
      json['results'].forEach((v) {
        results.add(new Movie.fromJson(v));
      });
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MovieResponse &&
              runtimeType == other.runtimeType &&
              totalResults == other.totalResults &&
              results == other.results &&
              totalPages == other.totalPages &&
              page == other.page;

  @override
  int get hashCode =>
      totalResults.hashCode ^
      results.hashCode ^
      totalPages.hashCode ^
      page.hashCode;




}