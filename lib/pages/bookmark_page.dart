import 'package:flutter/material.dart';

import '../widgets/bookmark_card.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 20, top: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                'Bookmark',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              ),
              Text(
                'Your collection here.',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              ),
              SizedBox(height: 20),
              BookmarkCard(title: 'UI/UX Design'),
              SizedBox(height: 20),
              BookmarkCard(title: 'Perfumery'),
              SizedBox(height: 20),
              BookmarkCard(title: 'Coffee'),
            ],
          ),
        ),
      )),
    );
  }
}
