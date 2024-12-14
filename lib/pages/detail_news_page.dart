// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DetailNewsPage extends StatelessWidget {
  const DetailNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.all(5),
              children: [
                Container(
                  width: 380,
                  height: 452,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    image: const DecorationImage(
                      image: AssetImage('assets/mountain_p.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 23, vertical: 18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff161719),
                            Color(0xff16171900),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Iconsax.arrow_left,
                                        color: Colors.black)),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Iconsax.share,
                                      color: Colors.black)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Iconsax.more,
                                      color: Colors.black)),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 20.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: const Color(0xffb3182828)
                                        .withOpacity(0.7)),
                                child: const Text(
                                  "Travel",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(width: 23),
                              const Text("8 min read - 2 hr ago",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'The Power and Beauty of the Natural World',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  'assets/rapper.jpg',
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 11),
                              const Text(
                                'Olivia Rose',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              const SizedBox(width: 15),
                              const Icon(Iconsax.eye,
                                  color: Colors.white, size: 14),
                              const SizedBox(width: 7),
                              const Text(
                                '1.3K',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'The Healing Power of Nature',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff161719)),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Nature has a remarkable ability to heal and restore. Studies have shown that spending time in natural environments can reduce stress, improve mood, and enhance overall well-being.',
                  style: TextStyle(
                      fontSize: 12, color: Color(0xff161719), height: 2),
                ),
                const SizedBox(height: 11),
                const Text(
                  'The Japanese practice of “shinrin-yoku,” or forest bathing, exemplifies this. Simply walking through a forest and immersing oneself in the sights, sounds, and smells of nature can lead to significant health benefits, including lower blood pressure, reduced anxiety, and increased feelings of happiness.',
                  style: TextStyle(
                      fontSize: 12, color: Color(0xff161719), height: 2),
                ),
                const SizedBox(height: 11),
                const Text(
                  'The sound of a babbling brook, the rustling of leaves in the wind, the sight of a colorful sunset—these natural experiences can evoke a sense of calm and peace that is hard to find in urban settings.',
                  style: TextStyle(
                      fontSize: 12, color: Color(0xff161719), height: 2),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 24, left: 60, right: 60),
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff14000000).withOpacity(0.08),
                      offset: const Offset(4, 10),
                      blurRadius: 50,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Iconsax.text)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Iconsax.headphone)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Iconsax.like)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Iconsax.bookmark_2)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
