import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newswave_app/domain/entities/news.dart';

import '../../core/utils.dart';

class MainNewsCard extends StatelessWidget {
  final News news;

  const MainNewsCard({
    super.key,
    required this.news,
  });

  bool isValidImageUrl(String? url) {
    return url != null &&
        url.startsWith('http') &&
        (url.endsWith('.jpg') || url.endsWith('.jpeg') || url.endsWith('.png'));
  }

  Widget buildImage(String imageUrl) {
    if (imageUrl.endsWith('.svg')) {
      return SvgPicture.network(imageUrl,
          placeholderBuilder: (_) => Image.asset("assets/vespa.jpg"));
    } else {
      return Image.network(imageUrl,
          errorBuilder: (_, __, ___) => Image.asset("assets/vespa.jpg"));
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        news.pubDate != null ? formatDate(news.pubDate!) : '-';

    return Container(
      margin: const EdgeInsets.only(right: 16),
      height: 405,
      width: 315,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(
            news.imageUrl != null && news.imageUrl!.isNotEmpty
                ? news.imageUrl!
                : "https://placehold.co/600x400",
          ),
          fit: BoxFit.cover,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color(0xff182828).withOpacity(0.8)),
              child: Text(
                (news.category?.isNotEmpty ?? false)
                    ? news.category!.first
                    : 'No Category',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
            const Spacer(),
            Text(
              news.sourceName ?? '-',
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(news.title ?? '-',
                style: const TextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white)),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(formattedDate,
                    style: const TextStyle(color: Colors.white)),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_border,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
