import 'package:flutter/material.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  List<String> tabs = [
    "Trending",
    "Food",
    "Travel",
    "Fashion",
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
      appBar: AppBar(
        title: Text("Halaman coba-coba"),
      ),
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
                              color: isSelected ? Colors.blue : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: 3,
                            width: isSelected ? 40 : 0,
                            decoration: BoxDecoration(
                              color:
                                  isSelected ? Colors.blue : Colors.transparent,
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
              children: [
                Center(
                    child: Text("Halaman Trending",
                        style: TextStyle(fontSize: 20))),
                Center(
                    child:
                        Text("Halaman Food", style: TextStyle(fontSize: 20))),
                Center(
                    child:
                        Text("Halaman Travel", style: TextStyle(fontSize: 20))),
                Center(
                    child: Text("Halaman Fashion",
                        style: TextStyle(fontSize: 20))),
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
