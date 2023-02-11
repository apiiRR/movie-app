import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../../../widgets/shimmer.dart';

class BuildLoadImage extends StatelessWidget {
  const BuildLoadImage({super.key, required this.size, required this.url});

  final Size size;
  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "https://image.tmdb.org/t/p/w500${url}",
      imageBuilder: (context, imageProvider) {
        return Container(
          width: 100,
          height: size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
        );
      },
      placeholder: (context, url) => BuildShimmer(
        child: Container(
          width: 100,
          height: size.height,
          decoration: BoxDecoration(
            color: white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      errorWidget: (context, url, error) {
        return Container(
          width: 100,
          height: size.height,
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
    );
  }
}
