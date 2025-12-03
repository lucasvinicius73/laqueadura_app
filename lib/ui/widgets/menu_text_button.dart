import 'package:flutter/material.dart';

class MenuTextButton extends StatelessWidget {
  const MenuTextButton({
    super.key,
    required this.title,
    required this.route,
    this.onPressed,
  });

  final String title;
  final String route;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: onPressed,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "QuickSand",
                  ),
                ),
              ),
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
