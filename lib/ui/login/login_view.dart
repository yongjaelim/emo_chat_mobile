import 'package:emo_chat_mobile/main.dart';
import 'package:emo_chat_mobile/ui/chatting_list/chatting_list_view.dart';
import 'package:emo_chat_mobile/ui/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final _key = GlobalKey<FormState>(); // for the future update for login feature
  TextEditingController idArea = TextEditingController();
  TextEditingController pwdArea = TextEditingController();

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
                loginForm()
              ],
            )
          )
      ),
    );
  }

  Widget loginForm() {
    return Form(
      key: _key,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                  bottom: 20
              ),
              child: Consumer<LoginViewModel>(
                builder: (context, loginViewModel, child) {
                  return TextFormField(
                    controller: idArea,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ID를 입력해주세요.',
                    ),
                    onChanged: (text){
                      loginViewModel.setId(text);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                  bottom: 50
              ),
              child: Consumer<LoginViewModel>(
                builder: (context, loginViewModel, child) {
                  return TextFormField(
                    controller: pwdArea,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '패스워드를 입력해주세요.',
                    ),
                    onChanged: (text){
                      loginViewModel.setPassword(text);
                    },
                    onFieldSubmitted: loginViewModel.getButtonEnabled ? (value) {
                      submit();
                      loginViewModel.makeFieldsEmpty();
                    } : null,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40
              ),
              child: Consumer<LoginViewModel>(
                builder: (context, loginViewModel, child) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: loginViewModel.getButtonEnabled ? () {
                        submit();
                        loginViewModel.makeFieldsEmpty();
                      } : null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange
                      ),
                      child: const Text('로그인'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submit() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const ChattingListView()
    ));
    FocusScope.of(context).unfocus();
    idArea.clear();
    pwdArea.clear();
  }

}

