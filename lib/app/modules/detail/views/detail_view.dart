import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../controllers/detail_controller.dart';
import 'components/body.dart';

class DetailView extends GetView<DetailController> {
  DetailView({Key? key}) : super(key: key);
  final String idMovie = Get.arguments;
  @override
  Widget build(BuildContext context) {
    controller.idMovie.value = idMovie;
    return Scaffold(
        backgroundColor: primaryBlue,
        body: FutureBuilder(
            future: controller.getDetailMovie(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: white,
                  ),
                );
              }

              return const Body();
            }));
  }
}
