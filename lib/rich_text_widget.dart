import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  String textA;
  String textB;
  RichTextWidget({
    Key? key,
    required this.textA,
    required this.textB,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: textA,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          const TextSpan(text: ' '),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.pushNamed(
                context,
                '/login_screen',
              ),
            text: textB,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}