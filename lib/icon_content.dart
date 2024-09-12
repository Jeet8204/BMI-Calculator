import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class Custom_Icon_Content extends StatelessWidget {
  const Custom_Icon_Content(
      {super.key, required this.icon, required this.data});
  final IconData icon;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          data,
          style: klabelTextStyle,
        )
      ],
    );
  }
}
