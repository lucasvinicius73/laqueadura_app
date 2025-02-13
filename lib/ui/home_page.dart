import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/widgets/menu_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: Image.asset("assets/icon_app.png"),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "MaterLife",
                      style: TextStyle(
                          color: Color(0xffCD5E91),
                          fontSize: 44.09,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Dangrek"),
                    )
                  ],
                ),
              ),
              MenuButton(
                title: "Etapas",
                subtitle: "Saiba tudo sobre as etapas da laqueadura",
                icon: "assets/menu_1.png",
                subIcon: "assets/menu_11.png",
                isFirst: true,
                route: "/steps",
              ),
              MenuButton(
                title: "Cuidados operatórios",
                subtitle: "Cuidados antes e depois da operação!",
                icon: "assets/menu_2.png",
                subIcon: "assets/menu_22.png",
                route: "/operativeCare",
              ),
              MenuButton(
                title: "Gestante",
                subtitle: "Cuidados especiais para gestantes",
                icon: "assets/menu_3.png",
                subIcon: "assets/menu_33.png",
                route: "/pregnant",
              ),
              MenuButton(
                title: "Lei do planejamento Familiar",
                subtitle: "Etenda as leis familiares!",
                icon: "assets/menu_4.png",
                subIcon: "assets/menu_44.png",
                route: "/laws",
              ),
              MenuButton(
                title: "Perguntas frequentes",
                subtitle: "Precisa de ajuda?",
                icon: "assets/menu_5.png",
                subIcon: "assets/menu_55.png",
                route: "/question",
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
