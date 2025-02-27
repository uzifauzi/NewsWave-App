import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newswave_app/core/injection.dart';
import 'package:newswave_app/presentation/bloc/sports_bloc/sports_news_bloc.dart';
import 'package:newswave_app/presentation/widgets/news_card.dart';

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
                  return const Center(child: CircularProgressIndicator());
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
    // return SingleChildScrollView(
    //   child: Column(
    //     children: List.generate(
    //       10,
    //       (index) => Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(
    //           height: 120,
    //           width: double.infinity,
    //           color: Colors.green[100 * ((index % 9) + 1)],
    //           child: Center(child: Text("Food Item ${index + 1}")),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
