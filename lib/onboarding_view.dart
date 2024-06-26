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
      "title": "Engage with the Community",
      "description": "Connect with others, share your experiences, and stay updated with real-time interactions and notifications. Build your network effortlessly.",
    },
    {
      "image": "assets/images/image2.png",
      "title": "Seamless Communication",
      "description": "Enjoy smooth and intuitive messaging with our advanced chatbot feature. Get instant responses and stay informed without hassle.",
    },
    {
      "image": "assets/images/image1.png",
      "title": "Secure and Protected",
      "description": "Your privacy is our priority. With state-of-the-art encryption and security measures, ensure your data is safe and secure at all times.",
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
                      style: TextStyle(fontSize: 20, color: otherColor,
                          fontWeight: FontWeight.bold),
                    ),
                  const   SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        onBoardingItem[index]["description"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: otherColor,),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Column(
              children: [
                currentPage == (onBoardingItem.length - 1)
                    ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    minimumSize: Size(150, 50),

                  ),
                  onPressed: continueMethod,
                  child: const Text("Continue",style: TextStyle(
                    fontWeight: FontWeight.bold,color: Colors.black
                  ),),
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onBoardingItem.length,
                        (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: index == currentPage ? 20 : 10,
                        width: index == currentPage ? 20 : 10,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: index == currentPage ? Colors.yellow : Colors.yellow,
                          shape: BoxShape.circle,
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
