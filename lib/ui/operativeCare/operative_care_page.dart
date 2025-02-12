import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/operativeCare/widgets/operative_care_button.dart';
import 'package:laqueadura_app/ui/operativeCare/widgets/text.dart';

class OperativeCarePage extends StatelessWidget {
  const OperativeCarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuidados Operatórios"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          spacing: 29,
          children: [
            SizedBox(
              child: Text(
                textOperativeCare,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            OperativeCareButton(
                title: "Cuidados pré-operatório",
                asset: "assets/operativeCare/plastic.png"),
            OperativeCareButton(
                title: "Cuidados pós-operatório",
                asset: "assets/operativeCare/surgery.png")
          ],
        ),
      ),
    );
  }
}
