import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/app/modules/widgets/shimmer.dart';

import '../utils/utils.dart';

class BuildAvatarAuthor extends StatelessWidget {
  const BuildAvatarAuthor({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) => BuildShimmer(
        child: CircleAvatar(
          backgroundColor: white.withOpacity(0.2),
        ),
      ),
      errorWidget: (context, url, error) => CircleAvatar(
        backgroundColor: white.withOpacity(0.2),
        child: const Icon(
          Icons.image_not_supported_outlined,
          color: thirdBlue,
        ),
      ),
    );
  }
}
