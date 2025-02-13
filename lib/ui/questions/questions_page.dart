import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/questions/widgets/questions_animated_container.dart';
import 'package:laqueadura_app/ui/questions/widgets/questions_label_text.dart';
import 'package:laqueadura_app/ui/widgets/send_button.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perguntas Frequentes"),
      ),
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 29,
            children: [
              QuestionsAnimatedContainer(
                title: "O que é a Laqueadura?",
                content:
                    "Laqueadura é um procedimento cirúrgico de esterilização feminina que consiste em bloquear ou cortar as trompas de Falópio, impedindo que os óvulos cheguem ao útero. É considerado um método contraceptivo permanente.",
              ),
              QuestionsAnimatedContainer(
                title: "A Laqueadura é reversível?",
                content:
                    "Laqueadura é um procedimento cirúrgico de esterilização feminina que consiste em bloquear ou cortar as trompas de Falópio, impedindo que os óvulos cheguem ao útero. É considerado um método contraceptivo permanente.",
              ),
              QuestionsAnimatedContainer(
                title: "Há contraindicações para a laqueadura pós-parto?",
                content:
                    "Laqueadura é um procedimento cirúrgico de esterilização feminina que consiste em bloquear ou cortar as trompas de Falópio, impedindo que os óvulos cheguem ao útero. É considerado um método contraceptivo permanente.",
              ),
              Text(
                "Faça uma pergunta:",
                style: TextStyle(fontSize: 20),
              ),
              QuestionsLabelText(label: "Nome"),
              QuestionsLabelText(label: "Email"),
              QuestionsLabelText(label: "Pergunta"),
              SendButton(
                title: "Enviar",
                onPress: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
