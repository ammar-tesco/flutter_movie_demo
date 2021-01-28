import 'package:demo_flutter_app/model/data/ComingSoonMovies.dart';
import 'package:demo_flutter_app/model/data/NewMovies.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class ImdbApi {
  // require api key at : https://rapidapi.com/IMDb-API/api/imdb-api1
  var apikey = "{api_key_here}";
  var baseUrl = "https://imdb-api.com/en/API";
  var headerKey = {
    "x-rapidapi-key": "{x-rapidapi-key-here}",
    "x-rapidapi-host": "imdb-api1.p.rapidapi.com"
  };

  Future<NewMovie> getNewMovie() async {
    final newMovieResponse =
        await http.get(baseUrl + "/inTheaters" + apikey, headers: headerKey);
    if (newMovieResponse.statusCode == 200) {
      return NewMovie.fromJson(json.decode(newMovieResponse.body));
    } else {
      return null;
    }
  }

  Future<ComingSoonMovies> getComingSoon() async {
    final comingSoonResponse =
        await http.get(baseUrl + "/ComingSoon" + apikey, headers: headerKey);
    if (comingSoonResponse.statusCode == 200) {
      return ComingSoonMovies.fromJson(json.decode(comingSoonResponse.body));
    } else {
      return null;
    }
  }
}
