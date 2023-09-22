import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:calculater_app/model/them.dart';
import 'package:flutter/material.dart';
import '../model/players_model.dart';
import '../widgets/bord_btn.dart';
import '../widgets/game_btn.dart';
import 'login_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});
  static const String routName = 'GamePage';

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  String player1 = '';
  String player2 = '';
  Color colorOfSymbol1 = const Color(0x000000ff);
  Color colorOfSymbol2 = const Color(0x000000ff);
  List<String> bord = ['', '', '', '', '', '', '', '', ''];
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    PlayerModel names =
        ModalRoute.of(context)!.settings.arguments as PlayerModel;
    player1 = names.player1Name;
    player2 = names.player2Name;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' Turn : ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      counter.isEven
                          ? Text(
                              player1,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: MyThemData.firstPlayerColor),
                            )
                          : Text(
                              player2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: MyThemData.secondPlayerColor),
                            ),
                    ],
                  )),
            ),
            Expanded(
              child: Container(
                color: const Color(0XFF5d6b85),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BordBtn(
                            context: context,
                            onBtnClick: onBtnClick,
                            index: 0,
                            symbol: bord[0],
                            colorOfText: bord[0] == 'X'
                                ? colorOfSymbol1
                                : colorOfSymbol2,
                          ),
                          BordBtn(
                            context: context,
                            onBtnClick: onBtnClick,
                            index: 1,
                            symbol: bord[1],
                            colorOfText: bord[1] == 'X'
                                ? colorOfSymbol1
                                : colorOfSymbol2,
                          ),
                          BordBtn(
                            context: context,
                            onBtnClick: onBtnClick,
                            symbol: bord[2],
                            index: 2,
                            colorOfText: bord[2] == 'X'
                                ? colorOfSymbol1
                                : colorOfSymbol2,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        BordBtn(
                          context: context,
                          onBtnClick: onBtnClick,
                          symbol: bord[3],
                          index: 3,
                          colorOfText:
                              bord[3] == 'X' ? colorOfSymbol1 : colorOfSymbol2,
                        ),
                        BordBtn(
                          context: context,
                          onBtnClick: onBtnClick,
                          symbol: bord[4],
                          index: 4,
                          colorOfText:
                              bord[4] == 'X' ? colorOfSymbol1 : colorOfSymbol2,
                        ),
                        BordBtn(
                          context: context,
                          onBtnClick: onBtnClick,
                          symbol: bord[5],
                          index: 5,
                          colorOfText:
                              bord[5] == 'X' ? colorOfSymbol1 : colorOfSymbol2,
                        ),
                      ],
                    )),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BordBtn(
                            context: context,
                            onBtnClick: onBtnClick,
                            symbol: bord[6],
                            index: 6,
                            colorOfText: bord[6] == 'X'
                                ? colorOfSymbol1
                                : colorOfSymbol2,
                          ),
                          BordBtn(
                            context: context,
                            onBtnClick: onBtnClick,
                            symbol: bord[7],
                            index: 7,
                            colorOfText: bord[7] == 'X'
                                ? colorOfSymbol1
                                : colorOfSymbol2,
                          ),
                          BordBtn(
                            context: context,
                            onBtnClick: onBtnClick,
                            symbol: bord[8],
                            index: 8,
                            colorOfText: bord[8] == 'X'
                                ? colorOfSymbol1
                                : colorOfSymbol2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: GameBtn(
                    color: MyThemData.greenColor,
                    txt: 'Reset Game',
                    function: () {
                      rest();
                      counter = 0;
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GameBtn(
                    color: MyThemData.firstPlayerColor,
                    txt: 'Restart Game',
                    function: () {
                      Navigator.pushReplacementNamed(
                          context, LoginPage.routeName);
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  bool checkWiner(String symbol) {
    for (int i = 0; i < bord.length; i += 3) {
      if (bord[i] == symbol && bord[i + 2] == symbol && bord[i + 1] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (bord[i] == symbol && bord[i + 3] == symbol && bord[i + 6] == symbol) {
        return true;
      }
    }
    if ((bord[0] == symbol && bord[4] == symbol && bord[8] == symbol) ||
        (bord[2] == symbol && bord[4] == symbol && bord[6] == symbol)) {
      return true;
    }

    return false;
  }

  void rest() {
    bord = ['', '', '', '', '', '', '', '', ''];
  }

  void onBtnClick(int index, Color colorOfText, BuildContext context) {
    if (bord[index].isNotEmpty) return;
    if (counter.isEven) {
      bord[index] = 'X';
      colorOfText = MyThemData.firstPlayerColor;
      colorOfSymbol1 = colorOfText;
      if (checkWiner('X')) {
        AwesomeDialog(
            btnOkOnPress: () {
            },
            title: '$player1 Win ',
            context: context,
            dialogType: DialogType.success,
            descTextStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.black, fontSize: 15),
            desc: 'he will Start next game',
            animType: AnimType.rightSlide,
            btnOkText: 'Play Again',
            btnCancelText: 'Exit',
            btnCancelOnPress: () {
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            }).show();
        rest();
        counter++;
      }
    } else {
      bord[index] = 'O';
      colorOfText = MyThemData.secondPlayerColor;
      colorOfSymbol2 = colorOfText;
      if (checkWiner('O')) {
        AwesomeDialog(
                btnOkOnPress: () {
                  rest();
                },
                title: '$player2 Win',
                context: context,
                dialogType: DialogType.success,
                descTextStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black, fontSize: 15),
                desc: 'he will Start next game',
                animType: AnimType.rightSlide,
                btnOkText: 'Play Again')
            .show();
        rest();
        counter++;
      }
    }

    setState(() {});
    counter++;
  }
}
