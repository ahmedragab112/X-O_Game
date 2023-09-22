import 'package:flutter/material.dart';

class BordBtn extends StatelessWidget {
  const BordBtn(
      {super.key,
      required this.symbol,
      required this.onBtnClick,
      required this.index,
      required this.colorOfText, required this.context});
  final String symbol;
  final int index;
  final Function onBtnClick;
  final Color colorOfText;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff0c1e3c),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Color(0XFF5d6b85), width: 5),
            ),),
        onPressed: () {
          onBtnClick(index, colorOfText,context);
        },
        child: Text(
          symbol,
          style: TextStyle(fontSize: 100, color: colorOfText),
        ),
      ),
    );
  }
}
