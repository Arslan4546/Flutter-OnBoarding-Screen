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
      "image": "assets/images/image3.png",
      "title": "A Happy Mode Between Two Brothers",
      "description": "The two brother are sitting together and making the tea for each other",
    },
    {
      "image": "assets/images/image2.png",
      "title": "A Family With A Happy Mode",
      "description": "The parents are in a happy mode with their child",
    },
    {
      "image": "assets/images/image1.png",
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
          Padding(
            padding: const EdgeInsets.only(right:20),
            child: TextButton(
              onPressed: continueMethod,
              child: Text(
                "Skip",
                style: TextStyle(
                  color: otherColor,
                  fontSize: 20,
                ),
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
                  const   SizedBox(height: 20),
                    Image(image: AssetImage(onBoardingItem[index]["image"]!)),
                  const   SizedBox(height: 20),
                    Text(
                      onBoardingItem[index]["title"]!,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: otherColor),
                    ),
                  const   SizedBox(height: 10),
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
            padding: const EdgeInsets.only(bottom: 70),
            child: Column(
              children: [
                currentPage == (onBoardingItem.length - 1)
                    ? ElevatedButton(

                  onPressed: continueMethod,
                  child: const Text("Continue"),
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
                          color: index == currentPage ? Colors.blue : Colors.blue,
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
