import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newswave_app/domain/entities/news.dart';

import '../../core/utils.dart';
import '../bloc/bookmark_bloc/bookmark_news_bloc.dart';

class NewsCard extends StatefulWidget {
  final News news;
  const NewsCard({
    super.key,
    required this.news,
  });

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    String formattedDate = formatDate(widget.news.pubDate);

    bool isBookmarked = false;

    void checkIfBookmarked() {
      final state = context.read<BookmarkNewsBloc>().state;
      if (state is BookmarkNewsLoaded) {
        setState(() {
          isBookmarked =
              state.newsList.any((news) => news.title == widget.news.title);
        });
      }
    }

    @override
    void initState() {
      super.initState();
      checkIfBookmarked();
    }

    void _toggleBookmark() {
      final bloc = context.read<BookmarkNewsBloc>();
      if (isBookmarked) {
        bloc.add(RemoveBookmarkNews(widget.news));
      } else {
        bloc.add(SaveBookmarkNews(widget.news));
      }

      setState(() {
        isBookmarked = !isBookmarked;
      });

      print("IS BOOKMARK: $isBookmarked");
    }

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
                  child: widget.news.imageUrl != null &&
                          widget.news.imageUrl!.startsWith("http")
                      ? Image.network(
                          widget.news.imageUrl!,
                          height: 96,
                          width: 96,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              "assets/vespa.jpg",
                              height: 96,
                              width: 96,
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : Image.asset(
                          "assets/vespa.jpg",
                          height: 96,
                          width: 96,
                          fit: BoxFit.cover,
                        ),
                )),
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
                        widget.news.sourceName ?? '-',
                        style: const TextStyle(
                            fontSize: 12, color: Color(0xff18272a)),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: _toggleBookmark,
                        icon: Icon(
                          isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                          color: const Color(0xff18272a),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz,
                            color: Color(0xff18272a),
                          )),
                    ],
                  ),
                  Text(widget.news.title ?? '-',
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
