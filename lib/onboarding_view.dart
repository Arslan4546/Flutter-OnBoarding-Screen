import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboarding_screen/login_screen.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  List<Map<String, String>> onBoardingItem = [
    {
      "image": "assets/images/img1.png",
      "title": "A Happy Mode Between Two Brothers",
      "description": "The two brother are sitting together and making the tea for each other",
    },
    {
      "image": "assets/images/img2.png",
      "title": "A Family With A Happy Mode",
      "description": "The parents are in a happy mode with their child",
    },
    {
      "image": "assets/images/img3.png",
      "title": "Cycling With Baby",
      "description": "The parents are very happy with their child and take the cycle game",
    },
  ];

  void continueMethod() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  int currentPage = 0;

  void onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  Color whiteColor = Colors.white;
  Color otherColor = const Color(0xFF19173D);
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: continueMethod,
            child: Text(
              "Skip",
              style: TextStyle(
                color: otherColor,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: onBoardingItem.length,
              scrollDirection: Axis.horizontal,
              onPageChanged: onChanged,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Image(image: AssetImage(onBoardingItem[index]["image"]!)),
                    SizedBox(height: 20),
                    Text(
                      onBoardingItem[index]["title"]!,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: otherColor),
                    ),
                    SizedBox(height: 10),
                    Text(
                      onBoardingItem[index]["description"]!,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: otherColor),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                currentPage == (onBoardingItem.length - 1)
                    ? ElevatedButton(
                  onPressed: continueMethod,
                  child: Text("Continue"),
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onBoardingItem.length,
                        (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 10,
                        width: index == currentPage ? 15 : 10,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: index == currentPage ? Colors.black : Colors.blue,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
