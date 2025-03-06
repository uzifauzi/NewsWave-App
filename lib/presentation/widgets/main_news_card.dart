import 'package:flutter/material.dart';
import 'package:newswave_app/domain/entities/news.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/utils.dart';

class MainNewsCard extends StatelessWidget {
  final News news;

  const MainNewsCard({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        news.pubDate != null ? formatDate(news.pubDate!) : '-';

    return GestureDetector(
      onTap: () async {
        final Uri url = Uri.parse(news.link!);
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        } else {
          debugPrint("Tidak dapat membuka URL");
        }
      },
      child: Container(
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
                      ? news.category!.first.capitalizeFirstLetter()
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
      ),
    );
  }
}
