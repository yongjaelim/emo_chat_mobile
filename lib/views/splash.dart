import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 500), (){
      getPermissions();
    });
  }

  void getPermissions() async {
    await Permission.camera.request();
    await Permission.photos.request();

    if(!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.05,
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
    );
  }
}
