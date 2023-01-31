import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Image.asset(
                  'assets/images/emo_chat.png',
                  width: width,
                  height: height * 0.1,
                ),
                SizedBox(
                  height: height * 0.2,
                ),
                Image.asset(
                  'assets/images/splash_logo.png',
                  //width: width,
                  height: height * 0.1,
                ),
                SizedBox(
                  height: height * 0.3,
                ),
                const Text(
                  '© Fasoo Co., Ltd. All rights reserved.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
