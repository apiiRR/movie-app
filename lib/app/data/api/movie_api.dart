import 'package:dio/dio.dart';

import 'strings.dart';

class MovieAPI {
  static Future<Map<String, dynamic>> getNowPlaying() async {
    try {
      Response response = await Dio()
          .get("https://api.themoviedb.org/3/movie/now_playing?api_key=$token");
      return {"status": "oke", "response": response.data};
    } on DioError catch (error) {
      return {"status": "error", "response": error.message};
    }
  }

  static Future<Map<String, dynamic>> getPopular() async {
    try {
      Response response = await Dio()
          .get("https://api.themoviedb.org/3/movie/popular?api_key=$token");
      return {"status": "oke", "response": response.data};
    } on DioError catch (error) {
      return {"status": "error", "response": error.message};
    }
  }

  static Future<Map<String, dynamic>> getUpcoming() async {
    try {
      Response response = await Dio()
          .get("https://api.themoviedb.org/3/movie/upcoming?api_key=$token");
      return {"status": "oke", "response": response.data};
    } on DioError catch (error) {
      return {"status": "error", "response": error.message};
    }
  }

  static Future<Map<String, dynamic>> getDetail(String id) async {
    try {
      Response response = await Dio()
          .get("https://api.themoviedb.org/3/movie/$id?api_key=$token");
      return {"status": "oke", "response": response.data};
    } on DioError catch (error) {
      return {"status": "error", "response": error.message};
    }
  }

  static Future<Map<String, dynamic>> getReviews(String id) async {
    try {
      Response response = await Dio()
          .get("https://api.themoviedb.org/3/movie/$id/reviews?api_key=$token");
      return {"status": "oke", "response": response.data};
    } on DioError catch (error) {
      return {"status": "error", "response": error.message};
    }
  }

  static Future<Map<String, dynamic>> getMoreReviews(
      String id, int page) async {
    try {
      Response response = await Dio().get(
          "https://api.themoviedb.org/3/movie/$id/reviews?api_key=$token&page=$page");
      return {"status": "oke", "response": response.data};
    } on DioError catch (error) {
      return {"status": "error", "response": error.message};
    }
  }

  static Future<Map<String, dynamic>> getMoreMovies(
      String movie, int page) async {
    try {
      Response response = await Dio().get(
          "https://api.themoviedb.org/3/movie/$movie?api_key=$token&page=$page");
      return {"status": "oke", "response": response.data};
    } on DioError catch (error) {
      return {"status": "error", "response": error.message};
    }
  }
}
