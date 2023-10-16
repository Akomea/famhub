import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  final String buttonText;
  final Color color;
  final dynamic onPressed;

  const GradientButton({Key? key, required this.buttonText, required this.onPressed, required this.color}) : super(key: key);

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: 50,
        width: MediaQuery.sizeOf(context).width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.color
        ),
        child: Center(
          child: Text(
              widget.buttonText,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto')),
        ),
      ),
    );
  }
}