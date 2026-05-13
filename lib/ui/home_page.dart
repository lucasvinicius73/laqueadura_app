import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/widgets/menu_button.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _version = '';

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final info = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {
        _version = 'v${info.version}+${info.buildNumber}';
      });
    }
  }

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
                title: "Decisão Consciente",
                subtitle: "Conheça todas as opções contraceptivas",
                icon: "assets/menu_3.png",
                subIcon: "assets/menu_66.png",
                route: "/consciousDecision",
              ),
              MenuButton(
                title: "CheckList",
                subtitle: "Cálculos, lembretes e documentação",
                icon: "assets/menu_4.png",
                subIcon: "assets/menu_77.png",
                route: "/checklist",
              ),
              MenuButton(
                title: "Meus Lembretes",
                subtitle: "Agende consultas, exames e prazos",
                icon: "assets/menu_5.png",
                subIcon: "assets/menu_88.png",
                route: "/reminders",
              ),
              MenuButton(
                title: "Gestante",
                subtitle: "Cuidados especiais para gestantes",
                icon: "assets/menu_6.png",
                subIcon: "assets/menu_33.png",
                route: "/pregnant",
              ),
              MenuButton(
                title: "Lei do planejamento Familiar",
                subtitle: "Etenda as leis familiares!",
                icon: "assets/menu_7.png",
                subIcon: "assets/menu_44.png",
                route: "/laws",
              ),
              MenuButton(
                title: "Perguntas frequentes",
                subtitle: "Precisa de ajuda?",
                icon: "assets/menu_8.png",
                subIcon: "assets/menu_55.png",
                route: "/question",
              ),
              MenuButton(
                title: "Area do parceiro",
                subtitle: "O seu papel no planejamento familiar",
                icon: "assets/menu_1.png",
                subIcon: "assets/menu_11.png",
                route: "/partner",
              ),
              MenuButton(
                title: "Saiba Mais",
                subtitle: "Sobre o Aplicativo",
                icon: "assets/menu_9.png",
                subIcon: "assets/menu_99.png",
                route: "/learnMore",
              ),
              const SizedBox(
                height: 22,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                constraints: const BoxConstraints(maxWidth: 200),
                child: Row(
                  children: [
                    SizedBox(
                      height: 65,
                      width: 55,
                      child: Image.asset("assets/about/logoCipe.png"),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 60,
                      width: 55,
                      child: Image.asset("assets/about/brasaouepa.png"),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 60,
                      width: 55,
                      child: Image.asset("assets/about/logoCapes.png"),
                    ),
                  ],
                ),
              ),
              if (_version.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    _version,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade400,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
