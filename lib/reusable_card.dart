import 'package:flutter/material.dart';

class reusableCard extends StatelessWidget {
  reusableCard(
      {super.key,
      required this.colour,
      this.cardChild,
      this.height,
      this.width});
  final Color colour;
  final Widget? cardChild;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(15),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: colour),
      child: cardChild,
    );
  }
}
