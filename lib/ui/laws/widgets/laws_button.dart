import 'package:flutter/material.dart';

class LawsButton extends StatelessWidget {
  const LawsButton({
    super.key,
    required this.title,
    required this.leftIcon,
    required this.rightIcon,
  });

  final String title;
  final String leftIcon;
  final String rightIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            elevation: WidgetStatePropertyAll(0),
            backgroundColor: WidgetStatePropertyAll(Colors.white),
            padding: WidgetStatePropertyAll(
                EdgeInsets.only(left: 9, right: 20, bottom: 12, top: 12)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
            ),
            side: WidgetStatePropertyAll(
                BorderSide(color: Color(0xFFE3E3E3), width: 1))),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              leftIcon,
              width: 36,
              height: 36,
            ),
            SizedBox(
              width: 11,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFFCD5E91),
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Image.asset(
              rightIcon,
              width: 36,
              height: 36,
            ),
          ],
        ));
  }
}
