import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import 'build_list_movie.dart';

class Body extends GetView<HomeController> {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          BuildListMovie(
            data: controller.dataNowPlaying!,
            size: size,
            title: "Now Playing",
            movie: "now_playing",
          ),
          const SizedBox(
            height: 24,
          ),
          BuildListMovie(
            data: controller.dataMostPopular!,
            size: size,
            title: "Most Popular",
            movie: "popular",
          ),
          const SizedBox(
            height: 24,
          ),
          BuildListMovie(
            data: controller.dataUpcoming!,
            size: size,
            title: "Upcoming",
            movie: "upcoming",
          ),
        ],
      ),
    );
  }
}
