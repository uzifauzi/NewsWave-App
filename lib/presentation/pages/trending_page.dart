import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newswave_app/core/injection.dart';
import 'package:newswave_app/domain/entities/news.dart';
import 'package:newswave_app/presentation/bloc/news_bloc/news_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../widgets/main_news_card.dart';
import '../widgets/news_card.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final newsBloc = di<NewsBloc>();

    return BlocProvider<NewsBloc>(
      create: (_) {
        final bloc = newsBloc;
        bloc.add(GetAllNewsEvent()); // Kirim event untuk memuat data
        return bloc;
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  return Skeletonizer(
                    enabled: true,
                    child: SizedBox(
                      height: 400,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const MainNewsCard(
                            news: News(
                                articleId: "1",
                                imageUrl: "https://placehold.co/600x400"),
                          );
                        },
                      ),
                    ),
                  );
                } else if (state is NewsSuccess) {
                  // Menampilkan hanya 5 berita pertama
                  final newsList = state.newsList.take(5).toList();
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: newsList
                          .map((news) => MainNewsCard(news: news))
                          .toList(),
                    ),
                  );
                } else if (state is NewsError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text("No Data Available"));
              },
            ),
            const SizedBox(height: 21),
            const NewsSection(title: "Following"),
            const SizedBox(height: 15),
            // munculkan data ke-6 sampai terakhir menggunakan widget NewsCard
            BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  // return const Center(child: CircularProgressIndicator());
                  return Skeletonizer(
                    enabled: true,
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const NewsCard(
                            news: News(articleId: "1"),
                          );
                        },
                      ),
                    ),
                  );
                } else if (state is NewsSuccess) {
                  final followingNewsList = state.newsList.skip(5).toList();
                  return Column(
                    children: followingNewsList
                        .map((news) => NewsCard(news: news))
                        .toList(),
                  );
                }
                return const SizedBox(); // Jika belum sukses, kosongkan agar tidak error
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NewsSection extends StatelessWidget {
  final String title;

  const NewsSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.add, color: Color(0xff323232)))
        ],
      ),
    );
  }
}
