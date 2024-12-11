import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/main_news_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffcfffd),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageHeader(),
              NewsSection(
                title: "For You",
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MainNewsCard(),
                    MainNewsCard(),
                  ],
                ),
              ),
              SizedBox(height: 21),
              NewsSection(
                title: "Following",
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 150,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/rapper.jpg',
                              height: 96,
                              width: 96,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 4),
                                  Text(
                                    'Alexia Virgie',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff18272a)),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.bookmark_border,
                                        color: Color(0xff18272a),
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.more_horiz,
                                        color: Color(0xff18272a),
                                      )),
                                ],
                              ),
                              Text(
                                  'Fusion of Retro Glamour and Futuristic Trends',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Color(0xff18272a))),
                              SizedBox(height: 4),
                              Text('8 min read • 2 hr ago',
                                  style: TextStyle(color: Color(0xff18272a))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4),
            ],
          ),
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
