import 'dart:convert';
import 'dart:io';
import 'package:flutterasyncredux/core/models/movie.dart';
import 'package:flutterasyncredux/core/models/movie_response.dart';

import 'package:http/http.dart' as http;

import 'app_exception.dart';
class MovieDBApi {
  MovieDBApi();

  final String _baseUrl = "http://api.themoviedb.org/3/";
  final String _apiKey = "3956f50a726a2f785334c24759b97dc6";

  Uri get kEventsBaseUrlRecommand =>
      Uri.https('api.themoviedb.org/3', '/movie/popular');
  Uri get kEventsBaseUrlUpcoming =>
      Uri.https('api.themoviedb.org/3', '/movie/upcoming');

  Future<dynamic> _get(String url) async {
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<List<Movie>> getPopularMovies() async {
    final response = await _get("movie/popular?api_key=$_apiKey");
    return MovieResponse.fromJson(response).results;
  }

  Future<List<Movie>> getUpcomingEvents() async {
    final response = await _get("movie/upcoming?api_key=$_apiKey");
    return MovieResponse.fromJson(response).results;
  }
  
  Future<Movie> getMovieDetail(Movie movie) async {
    final response = await _get('movie/${movie.id}?api_key=$_apiKey&append_to_response=videos,credits,images');
    return Movie.fromJson(response);
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

}