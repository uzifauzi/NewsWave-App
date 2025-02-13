import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newswave_app/core/injection.dart';
import 'package:newswave_app/presentation/bloc/news_bloc/news_bloc.dart';

import '../widgets/main_news_card.dart';

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
                  return const Center(child: CircularProgressIndicator());
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
            NewsSection(title: "Following"),
            const SizedBox(height: 15),
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

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 11, 20, 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'NewsWave.',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.notification4,
                color: Color(0xff323232),
              ))
        ],
      ),
    );
  }
}
