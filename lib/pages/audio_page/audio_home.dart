import 'package:flutter/material.dart';
import 'package:online_darsliklar/pages/feed_page/1maktab_darsliklari/1maktab_darsliklari.dart';
import 'package:online_darsliklar/pages/variable_page/variable_page.dart';

import '../../modellar/barchasi_uchun/itemofcontainer.dart';
class AudioHome extends StatefulWidget {
  final String apbar1;
  const AudioHome({Key? key, required this.apbar1}) : super(key: key);

  @override
  State<AudioHome> createState() => _AudioHomeState();
}

class _AudioHomeState extends State<AudioHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(widget.apbar1, style: const TextStyle(color: Colors.black),),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),
          ),
        ),
        extendBody: true,
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer("assets/images/feed_img/maktab_darsliklari.png","Darsliklar",MaktabDarsliklari(apbar: widget.apbar1, f: 'Darsliklar',)),
                    itemOfContainer(
                        "assets/images/feed_img/detiktiv_hikoyalar.png",
                        "Detiktiv hikoyalar",
                        const VariablePages(
                          f: "Detiktiv hikoya",
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer(
                        "assets/images/feed_img/romanlar.png",
                        "Romanlar",
                        const VariablePages(
                          f: "Romanlar",
                        )),
                    itemOfContainer(
                        "assets/images/feed_img/ertaklar.png",
                        "Ertaklar",
                        const VariablePages(
                          f: "Ertaklar",
                        )),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
