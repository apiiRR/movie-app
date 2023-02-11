import 'package:get/get.dart';

import '../../../data/api/movie_api.dart';
import '../../../data/model/detail_movie_model.dart';
import '../../../data/model/review_model.dart';

class DetailController extends GetxController {
  DetailMovieModel? detailMovie;
  List<ReviewModel>? reviewMovie;
  RxString idMovie = "".obs;

  Future getDetailMovie() async {
    detailMovie = null;
    try {
      final data = await MovieAPI.getDetail(idMovie.value);

      if (data["status"] == "oke") {
        final Map<String, dynamic> response =
            data["response"] as Map<String, dynamic>;
        detailMovie = DetailMovieModel.fromJson(response);
      } else {
        throw data["response"];
      }
    } catch (error) {
      return throw Exception("Error $error");
    }
  }

  Future getReviewMovie() async {
    reviewMovie = null;
    try {
      final data = await MovieAPI.getReviews(idMovie.value);

      if (data["status"] == "oke") {
        final Map<String, dynamic> response =
            data["response"] as Map<String, dynamic>;
        reviewMovie = (response["results"] as List)
            .map((e) => ReviewModel.fromJson(e))
            .toList();
      } else {
        throw data["response"];
      }
    } catch (error) {
      return throw Exception("Error $error");
    }
  }

  @override
  void onInit() {
    super.onInit();
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
