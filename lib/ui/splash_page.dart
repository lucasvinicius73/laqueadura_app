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
    goToHome();
  }

  goToHome() {
    Future.delayed(
        const Duration(seconds: 1),
        // ignore: use_build_context_synchronously
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
            "Laques",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Aprila",
              fontSize: 64,
              color: Color(0xffD8AEA2),
            ),
          ),
          Text(
            "Meu processo de laqueadura",
            style: TextStyle(
                fontFamily: "QuickSand",
                fontSize: 20,
                color: Color(0xffD8AEA2)),
          )
        ],
      ),
    );
  }
}
