import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/widgets/menu_text_button.dart';
import 'package:laqueadura_app/ui/steps/01_step_page.dart';
import 'package:laqueadura_app/ui/steps/02_step_page.dart';
import 'package:laqueadura_app/ui/steps/03_step_page.dart';
import 'package:laqueadura_app/ui/steps/04_step_page.dart';
import 'package:laqueadura_app/ui/steps/05_step_page.dart';
import 'package:laqueadura_app/ui/steps/06_step_page.dart';


class StepPage extends StatelessWidget {
  const StepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Etapas"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header visual
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xffD8AEA2),
                    const Color(0xffD8AEA2).withOpacity(0.7),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.stairs,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Etapas da Laqueadura",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Entenda todo o processo de forma clara e simples",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 180,
              //child: Image.asset("assets/video.png"),
              
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
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

                  // 06_steps_page
                  MenuTextButton(
                    title: "Como funciona o processo da laqueadura na Rede Privada?",
                    route: "",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Step06Page(),
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
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
