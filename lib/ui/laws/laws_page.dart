import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/laws/widgets/laws_button.dart';

class LawsPage extends StatelessWidget {
  const LawsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leis"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 29,
          children: [
            Text(
              "Entenda as leis do Planejamento Familiar:",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 354,
              height: 195,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.play_arrow,
                color: Colors.grey,
                size: 100 ,
              ),
            ),
            LawsButton(
                title: "Lei 14.443/2022",
                leftIcon: "assets/laws/family.png",
                rightIcon: "assets/laws/pdf.png"),
            LawsButton(
                title: "Lei 9.263/1996",
                leftIcon: "assets/laws/family.png",
                rightIcon: "assets/laws/pdf.png"),
          ],
        ),
      ),
    );
  }
}
