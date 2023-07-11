
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Yuklanganlar extends StatefulWidget {
  const Yuklanganlar({Key? key}) : super(key: key);

  @override
  State<Yuklanganlar> createState() => _YuklanganlarState();
}

class _YuklanganlarState extends State<Yuklanganlar> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(EvaIcons.download,size: 100),
      ),
    );
  }
}
