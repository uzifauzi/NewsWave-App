import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newswave_app/presentation/bloc/bloc/lifestyle_news_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../core/injection.dart';
import '../../domain/entities/news.dart';
import '../widgets/news_card.dart';

class LifestylePage extends StatelessWidget {
  const LifestylePage({super.key});

  @override
  Widget build(BuildContext context) {
    final lifestyleNewsBloc = di<LifestyleNewsBloc>();

    return BlocProvider<LifestyleNewsBloc>(
      create: (context) {
        final bloc = lifestyleNewsBloc;
        bloc.add(GetLifestyleNewsEvent());
        return bloc;
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<LifestyleNewsBloc, LifestyleNewsState>(
              builder: (context, state) {
                if (state is LifestyleNewsLoading) {
                  return Center(
                      child: Skeletonizer(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return const NewsCard(
                          news: News(
                            articleId: "1",
                          ),
                        );
                      },
                    ),
                  ));
                } else if (state is LifestyleNewsSuccess) {
                  final lifestyleNewsList = state.lifestyleNewsList;
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: lifestyleNewsList.length,
                    itemBuilder: (context, index) {
                      final sportNews = lifestyleNewsList[index];
                      return NewsCard(
                        news: sportNews,
                      );
                    },
                  );
                } else if (state is LifestyleNewsError) {
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
