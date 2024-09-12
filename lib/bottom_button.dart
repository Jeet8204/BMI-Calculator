import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(
      {super.key, required this.onTap, required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        color: kbottomContainerColor,
        height: kbottomContainerHeight,
        child: Center(
            child: Text(
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          buttonTitle,
        )),
      ),
    );
  }
}
