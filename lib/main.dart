
import 'package:calculater_app/model/them.dart';
import 'package:flutter/material.dart';

import 'pages/game_page.dart';
import 'pages/login_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.routeName,
      theme: MyThemData.them,
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        GamePage.routName: (context) => const GamePage()
      },
    );
  }
}
