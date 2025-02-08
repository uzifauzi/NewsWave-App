import 'package:flutter/material.dart';
import 'package:newswave_app/presentation/pages/detail_news_page.dart';

import '../../data/models/news.dart';

class SpotlightNewsCard extends StatelessWidget {
  final News news;

  const SpotlightNewsCard({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailNewsPage(newsId: news.id),
            ));
      },
      child: Container(
        key: ValueKey(news.id),
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(12),
        width: 152,
        height: 207,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff323232).withOpacity(0.12),
                blurRadius: 0.5,
                spreadRadius: 1.0,
                offset: const Offset(0, 1),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 128,
              height: 88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(news.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              clipBehavior: Clip.hardEdge,
              alignment: Alignment.topLeft,
              child: Container(
                  margin: const EdgeInsets.only(left: 4, top: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xff182828).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    news.newsCategory.name,
                    style: const TextStyle(fontSize: 10, color: Colors.white),
                  )),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/rapper.jpg',
                    height: 34,
                    width: 34,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  news.author ?? '-',
                  style: TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Text(
              news.title,
              style: const TextStyle(
                  color: Color(0xff18272a),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  height: 1.5),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(height: 7),
            const Text('8 min read - 1 hr ago',
                style: TextStyle(
                  color: Color(0xff18272a),
                  fontSize: 10,
                ))
          ],
        ),
      ),
    );
  }
}
