import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../utils/utils.dart';
import '../../../widgets/build_review_item.dart';
import '../../controllers/review_controller.dart';

class Body extends GetView<ReviewController> {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() {
      int length = controller.dataReview.length;
      return ListView.builder(
          controller: controller.scrollController,
          padding: EdgeInsets.only(
              left: size.width * 0.05, right: size.width * 0.05, bottom: 16),
          shrinkWrap: true,
          itemCount: length + 1,
          itemBuilder: (context, index) {
            if (index < length) {
              return BuildReviewItem(
                author: controller.dataReview[index].author,
                content: controller.dataReview[index].content,
                createdAt: DateFormat("d MMMM yyyy")
                    .format(controller.dataReview[index].createdAt),
                url: controller.dataReview[index].authorDetails.avatarPath,
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
