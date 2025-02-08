import 'package:flutter/material.dart';

class BookmarkCard extends StatelessWidget {
  final String title;

  const BookmarkCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                // ignore: use_full_hex_values_for_flutter_colors
                color: const Color(0xff00000014).withOpacity(0.08),
                blurRadius: 0.5,
                offset: const Offset(4, 10))
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  const Text(
                    '28 posts',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Color(0xff18272a),
                  )),
            ],
          ),
          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 4.5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                width: 165,
                height: 68,
                decoration: BoxDecoration(
                  // color: const Color(0xffadc6b0),
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.network('https://picsum.photos/id/230/250',
                    fit: BoxFit.cover),
              ),
              Container(
                width: 165,
                height: 68,
                decoration: BoxDecoration(
                  color: const Color(0xffadc6b0),
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.network('https://picsum.photos/seed/picsum/250',
                    fit: BoxFit.cover),
              ),
              Container(
                width: 165,
                height: 68,
                decoration: BoxDecoration(
                  color: const Color(0xffadc6b0),
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.network('https://picsum.photos/id/229/250',
                    fit: BoxFit.cover),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
