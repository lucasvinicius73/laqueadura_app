import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/widgets/menu_text_button.dart';

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
                  title: "Etapas do processo de laqueadura",
                  route: "",
                ),
                MenuTextButton(
                  title: "Assistência psicológica",
                  route: "",
                ),
                MenuTextButton(
                  title: "Assistência social",
                  route: "",
                ),
                MenuTextButton(
                  title: "Assistência ginecológica",
                  route: "",
                ),
                MenuTextButton(
                  title: "CheckList",
                  route: "",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
