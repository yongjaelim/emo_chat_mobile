import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:permission_handler/permission_handler.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController id = TextEditingController();
  TextEditingController pwd = TextEditingController();
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Permission.camera.request();
    await Permission.photos.request();

    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(40),
                child: Image.asset('assets/images/emo_chat.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                    bottom: 20
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ID를 입력해주세요.',
                  ),
                  controller: id,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                    bottom: 50
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '패스워드를 입력해주세요.',
                  ),
                  controller: pwd,
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40,
                    right: 40
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text('로그인'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange
                    ),
                  ),
                ),
              )
            ],

          )
        )
      ),
    );
  }
}

