import 'package:flutter/material.dart';
import 'package:newswave_app/presentation/pages/lifestyle_page.dart';
import 'package:newswave_app/presentation/pages/sports_page.dart';
import 'package:newswave_app/presentation/pages/tech_page.dart';
import 'package:newswave_app/presentation/pages/trending_page.dart';

class CustomTabLayout extends StatefulWidget {
  const CustomTabLayout({super.key});

  @override
  State<CustomTabLayout> createState() => _CustomTabLayoutState();
}

class _CustomTabLayoutState extends State<CustomTabLayout> {
  List<String> tabs = [
    "Trending",
    "Sports",
    "Technology",
    "Lifestyle",
    "Education",
    "Business",
  ];

  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.05,
            width: double.infinity,
            // color: Colors.redAccent,
            child: Container(
              height: size.height * 0.04,
              width: double.infinity,
              color: Colors.amber,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tabs.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  bool isSelected = currentIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: index == 0 ? 10 : 23, top: 7),
                      child: Column(
                        children: [
                          Text(
                            tabs[index],
                            style: TextStyle(
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isSelected ? Colors.black : Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 3,
                            width: isSelected ? 40 : 0,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.black
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: const [
                TrendingPage(),
                SportsPage(),
                TechPage(),
                LifestylePage(),
                Center(
                    child: Text("Halaman Education",
                        style: TextStyle(fontSize: 20))),
                Center(
                    child: Text("Halaman Business",
                        style: TextStyle(fontSize: 20))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
