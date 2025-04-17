import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newswave_app/core/injection.dart';
import 'package:newswave_app/domain/entities/news.dart';
import 'package:newswave_app/presentation/bloc/sports_bloc/sports_news_bloc.dart';
import 'package:newswave_app/presentation/widgets/news_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SportsPage extends StatelessWidget {
  const SportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sportsNewsBloc = di<SportsNewsBloc>();

    return BlocProvider<SportsNewsBloc>(
      create: (_) {
        final bloc = sportsNewsBloc;
        bloc.add(GetSportsNewsEvent()); // Kirim event untuk memuat data
        return bloc;
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<SportsNewsBloc, SportsNewsState>(
              builder: (context, state) {
                if (state is SportsNewsLoading) {
                  return Center(
                      child: Skeletonizer(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return NewsCard(
                          news: News(
                            articleId: "1",
                            imageUrl: "https://placehold.co/600x400",
                          ),
                        );
                      },
                    ),
                  ));
                } else if (state is SportsNewsSuccess) {
                  final sportsNewsList = state.sportsNewsList;
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: sportsNewsList.length,
                    itemBuilder: (context, index) {
                      final sportNews = sportsNewsList[index];
                      return NewsCard(
                        news: sportNews,
                      );
                    },
                  );
                } else if (state is SportsNewsError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text("No Data Available"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
