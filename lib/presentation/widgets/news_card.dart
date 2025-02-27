import 'package:flutter/material.dart';
import 'package:newswave_app/domain/entities/news.dart';

import '../../core/utils.dart';

class NewsCard extends StatelessWidget {
  final News news;
  const NewsCard({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = formatDate(news.pubDate);

    return Card(
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 150,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  news.imageUrl ?? "https://placehold.co/600x400",
                  height: 96,
                  width: 96,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/vespa.jpg", // Ganti dengan gambar placeholder dari asset
                      height: 96,
                      width: 96,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 4),
                      Text(
                        news.sourceName ?? '-',
                        style: const TextStyle(
                            fontSize: 12, color: Color(0xff18272a)),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_border,
                            color: Color(0xff18272a),
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz,
                            color: Color(0xff18272a),
                          )),
                    ],
                  ),
                  Text(news.title ?? '-',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xff18272a))),
                  const SizedBox(height: 4),
                  Text(formattedDate,
                      style: const TextStyle(color: Color(0xff18272a))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
