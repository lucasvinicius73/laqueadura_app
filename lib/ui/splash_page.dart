import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 1),
        () => Navigator.of(context).pushReplacementNamed('/home'));
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 230,
            child: Image.asset("assets/icon_app.png"),
          ),
          Text(
            "MaterLife",
            style: TextStyle(
                fontFamily: "Dangrek", fontSize: 64, color: Color(0xFFcd5e91)),
          ),
          SizedBox(
            height: 120,
          ),
          Text(
            "Cuidado e informação em cada etapa",
            style: TextStyle(fontFamily: "QuickSand", fontSize: 20),
          )
        ],
      ),
    );
  }
}
