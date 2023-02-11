import 'package:get/get.dart';

import '../../../data/api/movie_api.dart';
import '../../../data/model/movie_model.dart';

class HomeController extends GetxController {
  List<MovieModel>? dataNowPlaying;
  List<MovieModel>? dataMostPopular;
  List<MovieModel>? dataUpcoming;
  var isLoading = false.obs;

  Future getDataNowPlaying() async {
    dataNowPlaying = null;
    try {
      final data = await MovieAPI.getNowPlaying();

      if (data["status"] == "oke") {
        final Map<String, dynamic> response =
            data["response"] as Map<String, dynamic>;
        dataNowPlaying = (response["results"] as List)
            .map((e) => MovieModel.fromJson(e))
            .toList();
      } else {
        throw data["response"];
      }
    } catch (error) {
      return throw Exception("Error $error");
    }
  }

  Future getDataMostPopular() async {
    dataMostPopular = null;
    try {
      final data = await MovieAPI.getPopular();

      if (data["status"] == "oke") {
        final Map<String, dynamic> response =
            data["response"] as Map<String, dynamic>;
        dataMostPopular = (response["results"] as List)
            .map((e) => MovieModel.fromJson(e))
            .toList();
      } else {
        throw data["response"];
      }
    } catch (error) {
      return throw Exception("Error $error");
    }
  }

  Future getDataUpcoming() async {
    dataUpcoming = null;
    try {
      final data = await MovieAPI.getUpcoming();

      if (data["status"] == "oke") {
        final Map<String, dynamic> response =
            data["response"] as Map<String, dynamic>;
        dataUpcoming = (response["results"] as List)
            .map((e) => MovieModel.fromJson(e))
            .toList();
      } else {
        throw data["response"];
      }
    } catch (error) {
      return throw Exception("Error $error");
    }
  }

  Future getData() async {
    try {
      isLoading(true);
      await getDataNowPlaying();
      await getDataMostPopular();
      await getDataUpcoming();
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
