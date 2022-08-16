import 'package:dio/dio.dart';

class TMDBService {
  String apiKey = "c1e3a9ec181f8cd1a9967efbbbff7d8a";

  Future getLastestMovie({
    int page = 1,
  }) async {
    var url =
        "https://api.themoviedb.org/3/movie/latest?api_key=$apiKey&page=$page";
    var response = await Dio().get(url);
    return response.data;
  }

  Future getTrendingMovie({
    int page = 1,
  }) async {
    var url =
        "https://api.themoviedb.org/3/trending/all/day?api_key=$apiKey&page=$page";
    var response = await Dio().get(url);
    return response.data;
  }

  Future searchMovieByKeyword({
    required String query,
    int page = 1,
  }) async {
    var url =
        "https://api.themoviedb.org/3/search/keyword?query=$query&page=1&api_key=$apiKey&page=$page";
    var response = await Dio().get(url);
    return response.data;
  }
}
