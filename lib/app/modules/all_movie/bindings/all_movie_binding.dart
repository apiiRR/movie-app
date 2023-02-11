import 'package:get/get.dart';

import '../controllers/all_movie_controller.dart';

class AllMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllMovieController>(
      () => AllMovieController(),
    );
  }
}
