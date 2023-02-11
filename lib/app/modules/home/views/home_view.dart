import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../controllers/home_controller.dart';
import 'components/body.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
      appBar: AppBar(
        backgroundColor: secondaryBlue,
        title: Text(
          "MovieDB",
          style: text16(white, bold),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.isTrue) {
          return const Center(
            child: CircularProgressIndicator(
              color: white,
            ),
          );
        }

        return const Body();
      }),
    );
  }
}
