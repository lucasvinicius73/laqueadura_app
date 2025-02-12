import 'package:flutter/material.dart';

class MenuTextButton extends StatelessWidget {
  const MenuTextButton({super.key, required this.title, required this.route});

  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "QuickSand",
                ),
              ),
              Spacer(),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 25,
              ),
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
