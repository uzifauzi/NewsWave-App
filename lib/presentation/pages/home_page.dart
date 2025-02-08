import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newswave_app/presentation/widgets/custom_tab_layout.dart';

import '../widgets/main_news_card.dart';
import '../widgets/news_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffcfffd),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(),
            NewsSection(
              title: "For You",
            ),
            SizedBox(height: 16),
            // TODO: BUAT TAB LAYOUT
            Expanded(
              child: CustomTabLayout(),
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       MainNewsCard(),
            //       MainNewsCard(),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 21),
            // NewsSection(
            //   title: "Following",
            // ),
            // SizedBox(height: 4),
            // NewsCard(),
            // SizedBox(height: 4),
            // NewsCard(),
            // SizedBox(height: 4),
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
