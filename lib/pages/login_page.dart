
import 'package:flutter/material.dart';

import '../model/players_model.dart';
import '../widgets/playeres_filed.dart';
import 'game_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String routeName = 'loginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController player1Controller = TextEditingController();
  final TextEditingController player2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff303d5e),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  'Enter Players Name',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 40,
                ),
                PlayerSFiled(
                  controller: player1Controller,
                  playerName: 'Player 1 Name',
                ),
                const SizedBox(
                  height: 40,
                ),
                PlayerSFiled(
                    controller: player2Controller, playerName: 'Player 2 Name'),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.all(15)),
                  onPressed: () {
                    Navigator.pushNamed(context, GamePage.routName,
                        arguments: PlayerModel(
                            player1Name: player1Controller.text,
                           player2Name: player2Controller.text), 
                           );

                    setState(() {});
                  },
                  child: const Text(
                    'Start Game',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
