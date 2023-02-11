import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/utils.dart';
import '../../../widgets/shimmer.dart';
import '../../controllers/detail_controller.dart';
import 'build_tab_overview.dart';
import 'build_tab_review.dart';

class Body extends GetView<DetailController> {
  const Body({super.key});

  String getGenre() {
    List<String> genres = [];
    for (var element in controller.detailMovie!.genres) {
      genres.add(element.name);
    }

    String result = genres.join(",");
    return result;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Stack(
            children: [
              controller.detailMovie!.backdropPath != ""
                  ? CachedNetworkImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500/${controller.detailMovie!.backdropPath}",
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          width: size.width,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover)),
                        );
                      },
                      placeholder: (context, url) => BuildShimmer(
                        child: Container(
                          width: size.width,
                          height: 200,
                          decoration: BoxDecoration(
                            color: white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) {
                        return Container(
                          width: size.width,
                          height: 200,
                          decoration: BoxDecoration(
                            color: white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.image_not_supported_outlined,
                                color: thirdBlue,
                                size: 45,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "${error.statusCode}",
                                style: text14(white, medium),
                              ),
                              Text(
                                "Error ${error.uri}",
                                style: text12(white, light),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : Container(
                      width: size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        color: white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          color: thirdBlue,
                          size: 45,
                        ),
                      ),
                    ),
              Positioned(
                  child: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                    onPressed: () => Get.back(),
                    icon: CircleAvatar(
                      radius: 18,
                      backgroundColor: white.withOpacity(0.3),
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: white,
                      ),
                    )),
                elevation: 0,
              )),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              children: [
                Text(
                  controller.detailMovie!.originalTitle,
                  style: text18(white, bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('yyyy')
                          .format(controller.detailMovie!.releaseDate),
                      style: text14(fourthBlue, regular),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: CircleAvatar(
                        backgroundColor: white,
                        radius: 2,
                      ),
                    ),
                    Text(
                      "101 min",
                      style: text14(fourthBlue, regular),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      itemSize: 24,
                      ignoreGestures: true,
                      initialRating: controller.detailMovie!.voteAverage / 2,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
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
                      "${controller.detailMovie!.voteAverage.toStringAsFixed(1)} (${controller.detailMovie!.voteCount})",
                      style: text12(white, light),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                TabBar(
                    labelStyle: text16(white, semibold),
                    unselectedLabelColor: thirdBlue,
                    labelColor: primaryRed,
                    indicatorColor: primaryRed,
                    tabs: const [
                      Tab(
                        text: "Overview",
                      ),
                      Tab(
                        text: "Reviews",
                      )
                    ]),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                BuildTabOverview(size: size),
                BuildTabReviews(size: size)
              ]))
        ],
      ),
    );
  }
}
