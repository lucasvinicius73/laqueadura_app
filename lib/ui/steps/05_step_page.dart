import 'package:flutter/material.dart';

class Step05Page extends StatelessWidget {
  const Step05Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckList'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'CheckList',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "QuickSand",
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Esta é a página com o checklist para o processo de laqueadura.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: "QuickSand",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
