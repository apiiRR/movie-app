import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/utils.dart';
import '../../controllers/detail_controller.dart';

class BuildTabOverview extends GetView<DetailController> {
  const BuildTabOverview({
    super.key,
    required this.size,
  });

  final Size size;

  String getData(list) {
    List? dataList;
    List<String> data = [];

    switch (list) {
      case "genres":
        dataList = controller.detailMovie!.genres;
        break;
      case "production_company":
        dataList = controller.detailMovie!.productionCompanies;
        break;
      case "production_country":
        dataList = controller.detailMovie!.productionCountries;
        break;
      default:
    }

    for (var element in dataList!) {
      data.add(element.name);
    }

    String result = data.join(",");
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            "Synopsis",
            style: text16(white, medium),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            controller.detailMovie!.overview,
            style: text14(white, light),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Genre",
                  style: text14(white, medium),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  getData("genres"),
                  style: text14(white, light),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Production Company",
                  style: text14(white, medium),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  getData("production_company"),
                  style: text14(white, light),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Production Countries",
                  style: text14(white, medium),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  getData("production_country"),
                  style: text14(white, light),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Status",
                  style: text14(white, medium),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  controller.detailMovie!.status,
                  style: text14(white, light),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Released Date",
                  style: text14(white, medium),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  DateFormat("d MMMM yyyy")
                      .format(controller.detailMovie!.releaseDate),
                  style: text14(white, light),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Tagline",
                  style: text14(white, medium),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  controller.detailMovie!.tagline,
                  style: text14(white, light),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
