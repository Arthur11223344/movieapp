import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/movie_models.dart';
class APIServices{
  Future<List<MovieModel>> getMovies() async {
    Uri _uri = Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=a1c50a4be7ed8195db574e9771b2e9fb&language=es-Es");
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> myMap = json.decode(response.body);
      List movies = myMap["results"];
      List<MovieModel> movieList=movies.map((e) => MovieModel.fromJson(e)).toList();
      return movieList;
    }
    return [];
  }
}







