import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../routes/app_pages.dart';
import '../../../utils/utils.dart';
import '../../controllers/all_movie_controller.dart';
import 'build_load_image.dart';

class Body extends GetView<AllMovieController> {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() {
      int length = controller.dataMovie.length;
      return ListView.builder(
          controller: controller.scrollController,
          padding: EdgeInsets.only(
              left: size.width * 0.05, right: size.width * 0.05, bottom: 16),
          shrinkWrap: true,
          itemCount: length + 1,
          itemBuilder: (context, index) {
            if (index < length) {
              return InkWell(
                onTap: () => Get.toNamed(Routes.DETAIL,
                    arguments: controller.dataMovie[index].id.toString()),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 16),
                  width: size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      color: white.withOpacity(0.2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      BuildLoadImage(
                        size: size,
                        url: controller.dataMovie[index].posterPath,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    controller.dataMovie[index].originalTitle,
                                    style: text16(white, semibold),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    DateFormat("d MMMM yyyy").format(controller
                                        .dataMovie[index].releaseDate),
                                    style: text14(fourthBlue, regular),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RatingBar.builder(
                                    itemSize: 16,
                                    ignoreGestures: true,
                                    initialRating: controller
                                            .dataMovie[index].voteAverage /
                                        2,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    unratedColor: white,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${controller.dataMovie[index].voteAverage.toStringAsFixed(1)}(${controller.dataMovie[index].voteCount})",
                                    style: text12(white, light),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: controller.isMoreDataAvailable.isTrue
                      ? const CircularProgressIndicator(
                          color: white,
                        )
                      : Text(
                          "No more data to load",
                          style: text12(white, regular),
                        ),
                ),
              );
            }
          });
    });
  }
}
