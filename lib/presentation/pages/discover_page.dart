import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newswave_app/data/models/news.dart';

import '../widgets/spotlight_news_card.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfffcfffd),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Discover',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                const Text(
                  'Let\'s find new things.',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Color(0xff313131)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Color(0xff313131).withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'Search...',
                          hintStyle: const TextStyle(color: Color(0xff8b8c8b)),
                          suffixIcon: const Icon(Iconsax.search_normal),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Iconsax.filter_search5)),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Trending',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height:
                      220, // Tentukan tinggi jika ListView berada di scroll horizontal
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8.0),
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      final news = newsList[index];
                      return SpotlightNewsCard(news: news);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Latest',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height:
                      220, // Tentukan tinggi jika ListView berada di scroll horizontal
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8.0),
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      final news = newsList[index];
                      return SpotlightNewsCard(news: news);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Category',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Container(
                        width: 165,
                        height: 68,
                        decoration: BoxDecoration(
                          color: const Color(0xffadc6b0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Container(
                        width: 165,
                        height: 68,
                        decoration: BoxDecoration(
                          color: const Color(0xff55625b),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Container(
                        width: 165,
                        height: 68,
                        decoration: BoxDecoration(
                          color: const Color(0xffadc6b0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Container(
                        width: 165,
                        height: 68,
                        decoration: BoxDecoration(
                          color: const Color(0xff55625b),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
