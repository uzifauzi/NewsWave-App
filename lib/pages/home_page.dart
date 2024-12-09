import 'package:flutter/material.dart';

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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'NewsWave.',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'For you',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add))
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 405,
              width: 315,
              padding: EdgeInsets.symmetric(horizontal: 23, vertical: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage('assets/vespa.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              clipBehavior: Clip.hardEdge,
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CNN Indonesia",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text("Vespa Navigation: Navigating The Scooter Scene",
                      style: TextStyle(fontWeight: FontWeight.w700)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
