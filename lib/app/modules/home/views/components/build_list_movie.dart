import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/movie_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../utils/utils.dart';
import 'build_load_image.dart';

class BuildListMovie extends StatelessWidget {
  const BuildListMovie(
      {super.key,
      required this.size,
      required this.title,
      required this.data,
      required this.movie});

  final Size size;
  final String title;
  final List<MovieModel> data;
  final String movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: text18(white, bold),
              ),
              InkWell(
                onTap: () => Get.toNamed(Routes.ALL_MOVIE, arguments: {
                  "title": title,
                  "data_movie": data,
                  "movie": movie
                }),
                child: Text(
                  "See all",
                  style: text14(white, regular),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          width: size.width,
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => InkWell(
                    onTap: () => Get.toNamed(Routes.DETAIL,
                        arguments: data[index].id.toString()),
                    child: BuildLoadImage(
                      url: data[index].posterPath,
                      index: index,
                      size: size,
                    ),
                  )),
        ),
      ],
    );
  }
}
