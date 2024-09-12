import "package:flutter/material.dart";

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFF4C4F5E),
        elevation: 0.0,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
