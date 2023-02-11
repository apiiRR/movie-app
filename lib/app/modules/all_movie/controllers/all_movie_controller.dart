import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/movie_api.dart';
import '../../../data/model/movie_model.dart';

class AllMovieController extends GetxController {
  var dataMovie = List<MovieModel>.empty(growable: true).obs;
  RxString movie = "".obs;
  ScrollController scrollController = ScrollController();
  var page = 1;
  var isMoreDataAvailable = true.obs;

  Future getData(int page) async {
    try {
      final data = await MovieAPI.getMoreMovies(movie.value, page);

      if (data["status"] == "oke") {
        final Map<String, dynamic> response =
            data["response"] as Map<String, dynamic>;

        if (response["results"].length > 0) {
          isMoreDataAvailable(true);
        } else {
          isMoreDataAvailable(false);
        }

        dataMovie.addAll((response["results"] as List)
            .map((e) => MovieModel.fromJson(e))
            .toList());
      } else {
        isMoreDataAvailable(false);
        throw data["response"];
      }
    } catch (error) {
      isMoreDataAvailable(false);
      return throw Exception("Error $error");
    }
  }

  void paginateTask() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        page++;
        getData(page);
      }
    });
  }

  @override
  void onInit() {
    super.onInit();

    paginateTask();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
