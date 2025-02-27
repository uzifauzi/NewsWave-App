import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newswave_app/core/injection.dart';
import 'package:newswave_app/presentation/bloc/tech_bloc/tech_news_bloc.dart';
import 'package:newswave_app/presentation/widgets/news_card.dart';

class TechPage extends StatelessWidget {
  const TechPage({super.key});

  @override
  Widget build(BuildContext context) {
    final techNewsBloc = di<TechNewsBloc>();

    return BlocProvider<TechNewsBloc>(
      create: (_) {
        final bloc = techNewsBloc;
        bloc.add(GetTechNewsEvent()); // Kirim event untuk memuat data
        return bloc;
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<TechNewsBloc, TechNewsState>(
              builder: (context, state) {
                if (state is TechNewsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TechNewsSuccess) {
                  final techNewsList = state.techNewsList;
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: techNewsList.length,
                    itemBuilder: (context, index) {
                      final techNews = techNewsList[index];
                      return NewsCard(
                        news: techNews,
                      );
                    },
                  );
                } else if (state is TechNewsError) {
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
