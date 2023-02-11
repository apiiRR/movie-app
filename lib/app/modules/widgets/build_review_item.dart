import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'build_avatar_author.dart';

class BuildReviewItem extends StatelessWidget {
  const BuildReviewItem(
      {super.key,
      required this.url,
      required this.author,
      required this.createdAt,
      required this.content});

  final String url;
  final String author;
  final String createdAt;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: url != ""
              ? BuildAvatarAuthor(
                  url: "https://image.tmdb.org/t/p/w500${url}",
                )
              : CircleAvatar(
                  backgroundColor: white.withOpacity(0.2),
                  child: const Icon(
                    Icons.image_not_supported_outlined,
                    color: thirdBlue,
                  ),
                ),
          title: Text(
            author,
            style: text14(white, bold),
          ),
          subtitle: Text(
            createdAt,
            style: text12(white, light),
          ),
        ),
        Text(
          content,
          style: text12(white, regular),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
