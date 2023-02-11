import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../routes/app_pages.dart';
import '../../../utils/utils.dart';
import '../../../widgets/build_review_item.dart';
import '../../controllers/detail_controller.dart';

class BuildTabReviews extends GetView<DetailController> {
  const BuildTabReviews({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getReviewMovie(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: white,
              ),
            );
          }

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 16,
              ),
              controller.reviewMovie != null &&
                      controller.reviewMovie!.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.reviewMovie!.length > 3
                              ? 3
                              : controller.reviewMovie!.length,
                          itemBuilder: (context, index) => BuildReviewItem(
                            author: controller.reviewMovie![index].author,
                            content: controller.reviewMovie![index].content,
                            createdAt: DateFormat("d MMMM yyyy").format(
                                controller.reviewMovie![index].createdAt),
                            url: controller
                                .reviewMovie![index].authorDetails.avatarPath,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  backgroundColor: primaryRed,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24))),
                              onPressed: () => Get.toNamed(Routes.REVIEW,
                                      arguments: {
                                        "data_review": controller.reviewMovie,
                                        "id_movie": controller.idMovie
                                      }),
                              child: Text(
                                "See All",
                                style: text12(white, light),
                              )),
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        "Data review not found",
                        style: text12(white, regular),
                      ),
                    ),
              const SizedBox(
                height: 16,
              ),
            ]),
          );
        });
  }
}
