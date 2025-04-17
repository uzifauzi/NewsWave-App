import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newswave_app/presentation/bloc/bookmark_bloc/bookmark_news_bloc.dart';

import '../../core/injection.dart';
import '../widgets/news_card.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarkNewsBloc = di<BookmarkNewsBloc>();

    return BlocProvider<BookmarkNewsBloc>(
      create: (_) {
        final bloc = bookmarkNewsBloc;
        bloc.add(FetchBookmarkNews()); // 🔥 Tambahkan pemanggilan event ini
        return bloc;
      },
      child: Scaffold(
        body: SafeArea(
            child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 20, top: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const Text(
                  'Bookmark',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                const Text(
                  'Your collection here.',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: BlocBuilder<BookmarkNewsBloc, BookmarkNewsState>(
                      builder: (context, state) {
                    if (state is BookmarkNewsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is BookmarkNewsLoaded) {
                      final bookmarkedNews = state.newsList;
                      if (bookmarkedNews.isEmpty) {
                        return const Center(
                          child: Text("No bookmarks yet."),
                        );
                      }
                      return ListView.builder(
                        itemCount: bookmarkedNews.length,
                        itemBuilder: (context, index) {
                          return NewsCard(news: bookmarkedNews[index]);
                        },
                      );
                    } else if (state is BookmarkNewsError) {
                      return Center(child: Text(state.message));
                    }
                    return const Center(child: Text("No data available."));
                  }),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
