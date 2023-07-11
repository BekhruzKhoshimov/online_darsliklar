import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: const Image(image: AssetImage("assets/images/home_img/111.png")),
      title: const Text(
        "Online Darsliklar",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      showLoader: true,
      loadingText: const Text("Yuklanmoqda..."),
      navigator: const HomePage(),
      durationInSeconds: 5,
    );
  }
}