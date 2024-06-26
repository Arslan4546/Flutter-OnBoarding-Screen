import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'onboarding_view.dart';
class LoadingS extends StatefulWidget {
  const LoadingS({super.key});

  @override
  State<LoadingS> createState() => _LoadingSState();
}

class _LoadingSState extends State<LoadingS> {

  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), ()
    {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const OnBoardingView()));
    }
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                child:   const SpinKitWaveSpinner(
                  color: Colors.yellow,
                  trackColor: Colors.yellow,
                  waveColor: Colors.yellow,
                  size: 150.0,
                  duration: Duration(seconds: 5),

                ),

              ),


            ],
          ),
        )
    );
  }
}
