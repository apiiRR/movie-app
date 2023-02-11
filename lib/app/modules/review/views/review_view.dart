import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../controllers/review_controller.dart';
import 'components/body.dart';

class ReviewView extends GetView<ReviewController> {
  ReviewView({Key? key}) : super(key: key);
  final Map<String, dynamic> data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    controller.dataReview.value = data["data_review"];
    controller.idMovie = data["id_movie"];
    return Scaffold(
        backgroundColor: primaryBlue,
        appBar: AppBar(
          backgroundColor: primaryBlue,
          title: Text(
            'Reviews',
            style: text16(white, bold),
          ),
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
          centerTitle: true,
          elevation: 0,
        ),
        body: const Body());
  }
}
