import 'package:flutter/material.dart';

class QuestionsLabelText extends StatelessWidget {
  const QuestionsLabelText({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Color(0xFFE7E7E7), width: 1),
          )),
    );
  }
}
