import 'package:flutter/material.dart';

class OperativeCareButton extends StatelessWidget {
  const OperativeCareButton({
    super.key,
    required this.title,
    required this.asset,
    this.onPressed,
  });
  final String title;
  final String asset;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            elevation: const WidgetStatePropertyAll(0),
            backgroundColor: const WidgetStatePropertyAll(Colors.white),
            padding: const WidgetStatePropertyAll(
                EdgeInsets.only(left: 9, right: 20, bottom: 12, top: 12)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
            ),
            side: const WidgetStatePropertyAll(
                BorderSide(color: Color(0xFFE3E3E3), width: 1))),
        child: Row(
          children: [
            Image.asset(
              asset,
              width: 36,
              height: 36,
            ),
            const SizedBox(
              width: 11,
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFFCD5E91),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              color: Color(0xFFCD5E91),
              size: 30,
            ),
          ],
        ));
  }
}
