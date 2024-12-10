import 'package:flutter/material.dart';

import '../widgets/main_news_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageHeader(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'For you',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const MainNewsCard()
          ],
        ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'NewsWave.',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
    );
  }
}
