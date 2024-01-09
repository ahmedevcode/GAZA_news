import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'home_view.dart';

class OnBoarding extends StatelessWidget {
  final PageController _pageController = PageController();

  OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OnBoard(
        pageController: _pageController,
        onBoardData: onBoardData,
        titleStyles: const TextStyle(
          color: Color(0xff2e1f3f),
          fontSize: 26,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
        descriptionStyles: const TextStyle(
            fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),
        pageIndicatorStyle: const PageIndicatorStyle(
          width: 100,
          inactiveColor: Color.fromARGB(255, 112, 104, 121),
          activeColor: Color(0xff2e1f3f),
          inactiveSize: Size(4, 4),
          activeSize: Size(8, 8),
        ),
        skipButton: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeView(),
              ),
            );
          },
          child: const Text(
            "Skip",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xff2e1f3f),
            ),
          ),
        ),
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return InkWell(
              onTap: () => _onNextTap(state),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  state.isLastPage
                      ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeView(),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xff2e1f3f),
                      ),
                      child: const Text(
                        "Done",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                      : Container(
                    width: 150,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xff2e1f3f),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {}
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "Explore Topics",
    description: '''Discover news that matter to you
  from politics to technology''',
    imgUrl: "assets/onboard3.jpg",
  ),
  const OnBoardModel(
    title: "Breaking News",
    description: "Our mission: Keeping you in the know, always",
    imgUrl: 'assets/onboard4.jpeg',
  ),
];
