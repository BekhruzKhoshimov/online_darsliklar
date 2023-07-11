
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SozlamalarPage extends StatefulWidget {
  const SozlamalarPage({Key? key}) : super(key: key);

  @override
  State<SozlamalarPage> createState() => _SozlamalarPageState();
}

class _SozlamalarPageState extends State<SozlamalarPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(EvaIcons.settings2Outline,size: 100),
      ),
    );
  }
}
