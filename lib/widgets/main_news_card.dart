import 'package:flutter/material.dart';

class MainNewsCard extends StatelessWidget {
  const MainNewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 405,
      width: 315,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('assets/vespa.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color(0xff182828).withOpacity(0.8)),
              child: const Text(
                "Business",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
            const Spacer(),
            const Text(
              "CNN Indonesia",
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            ),
            const SizedBox(height: 4),
            const Text("Vespa Navigation: Navigating The Scooter Scene",
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white)),
            const SizedBox(height: 4),
            Row(
              children: [
                const Text("8 min read - 2 hr ago",
                    style: TextStyle(color: Colors.white)),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_border,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
