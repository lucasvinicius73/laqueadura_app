import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/widgets/menu_text_button.dart';
import 'package:laqueadura_app/ui/steps/01_step_page.dart';
import 'package:laqueadura_app/ui/steps/02_step_page.dart';
import 'package:laqueadura_app/ui/steps/03_step_page.dart';
import 'package:laqueadura_app/ui/steps/04_step_page.dart';
import 'package:laqueadura_app/ui/steps/05_step_page.dart';

class StepPage extends StatelessWidget {
  const StepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Etapas"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Image.asset("assets/video.png"),
            ),
            SizedBox(
              height: 66,
            ),
            Column(
              children: [
                MenuTextButton(
                  title: "O que é laqueadura e como funciona o procedimento",
                  route: "",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StepDetailPage(stepNumber: 1),
                      ),
                    );
                  },
                ),
                MenuTextButton(
                  title: "Quais são as etapas antes da cirurgia?",
                  route: "",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Step02Page(),
                      ),
                    );
                  },
                ),
                MenuTextButton(
                  title: "Quem vai te acompanhar nesse processo?",
                  route: "",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Step03Page(),
                      ),
                    );
                  },
                ),
                MenuTextButton(
                  title: "Como funciona o processo da laqueadura no SUS?",
                  route: "",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Step04Page(),
                      ),
                    );
                  },
                ),
                MenuTextButton(
                  title: "CheckList",
                  route: "",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Step05Page(),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
