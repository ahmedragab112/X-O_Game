import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:calculater_app/model/them.dart';
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
      backgroundColor: MyThemData.backGroundColor,
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
                Text(
                  'Enter Players Name',
                  style: Theme.of(context).textTheme.bodyLarge,
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
                    if (player1Controller.text.isNotEmpty &&
                        player2Controller.text.isNotEmpty) {
                      Navigator.pushNamed(
                        context,
                        GamePage.routName,
                        arguments: PlayerModel(
                            player1Name: player1Controller.text,
                            player2Name: player2Controller.text),
                      );

                      setState(() {});
                    } else {
                      AwesomeDialog(
                              context: context,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc:
                                  'You can\'t sign in with out player1\'s name or player2\'s or both',
                              descTextStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.black, fontSize: 15),
                              dialogType: DialogType.info)
                          .show();
                    }
                  },
                  child: Text(
                    'Start Game',
                    style: Theme.of(context).textTheme.bodyMedium,
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
