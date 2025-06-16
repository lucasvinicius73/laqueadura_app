import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/widgets/menu_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 66,
                      height: 66,
                      child: Image.asset("assets/icon_app.png"),
                    ),
                    SizedBox(width: 8),
                    Transform.translate(
                      offset: const Offset(0, 20),
                      child: Text(
                        "Laques",
                        style: TextStyle(
                          color: Color(0xffD8AEA2),
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Aprila",
                        ),
                      ),
                    ),
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
