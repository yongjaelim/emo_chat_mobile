import 'package:emo_chat_mobile/view_models/emoji_view_model.dart';
import 'package:emo_chat_mobile/view_models/login_view_model.dart';
import 'package:emo_chat_mobile/view_models/message_view_model.dart';
import 'package:emo_chat_mobile/views/login_view.dart';
import 'package:emo_chat_mobile/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => EmojiViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => MessageViewModel(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          darkTheme: ThemeData.dark(),
          theme: ThemeData(
            primaryColor: Colors.white,
            appBarTheme: const AppBarTheme(
                shadowColor: Colors.black,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black),
          ),
          routes: {"/login": (context) => const LoginView()},
          home: const SplashScreen()),
    );
  }
}
