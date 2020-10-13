import 'package:http/http.dart';

class TMDBApi {
  TMDBApi(this.client);

  final Client client;

  static final String baseUrl = 'api.themoviedb.org';

}