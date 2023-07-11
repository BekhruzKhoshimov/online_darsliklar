// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../modellar/barchasi_uchun/itemofcontainer.dart';
import '../../variable_page/variable_audio_page.dart';
import '../../variable_page/variable_sinf_page.dart';

class MaktabDarsliklari extends StatefulWidget {

  final String tili = "Maktab Darsliklari";
  final String apbar;
  final String f;

  const MaktabDarsliklari({Key? key, required, required this.apbar, required this.f,}) : super(key: key);

  @override
  State<MaktabDarsliklari> createState() => _MaktabDarsliklariState();
}

class _MaktabDarsliklariState extends State<MaktabDarsliklari> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.f, style: TextStyle(color: Colors.black),),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),
        ),
      ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer3("assets/images/mak_dars_img/1_sinf.png", Sinf(f: "1-sinf", tili: widget.tili,),widget.apbar,VariableAudioPages()),
                    itemOfContainer3("assets/images/mak_dars_img/2_sinf.png", Sinf(f: "2-sinf", tili: widget.tili,),widget.apbar,VariableAudioPages()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer3("assets/images/mak_dars_img/3_sinf.png", Sinf(f: "3-sinf", tili: widget.tili,),widget.apbar,VariableAudioPages()),
                    itemOfContainer3("assets/images/mak_dars_img/4_sinf.png", Sinf(f: "4-sinf", tili: widget.tili,),widget.apbar,VariableAudioPages()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer3("assets/images/mak_dars_img/5_sinf.png", Sinf(f: "5-sinf",tili: widget.tili,),widget.apbar,VariableAudioPages()),
                    itemOfContainer3("assets/images/mak_dars_img/6_sinf.png", Sinf(f: "6-sinf",tili: widget.tili,),widget.apbar,VariableAudioPages()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer3("assets/images/mak_dars_img/7_sinf.png", Sinf(f: "7-sinf",tili: widget.tili,),widget.apbar,VariableAudioPages()),
                    itemOfContainer3("assets/images/mak_dars_img/8_sinf.png", Sinf(f: "8-sinf",tili: widget.tili,),widget.apbar,VariableAudioPages()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer3("assets/images/mak_dars_img/9_sinf.png",Sinf(f: "9-sinf",tili: widget.tili,),widget.apbar,VariableAudioPages()),
                    itemOfContainer3("assets/images/mak_dars_img/10_sinf.png",Sinf(f: "10-sinf",tili: widget.tili,),widget.apbar,VariableAudioPages()),
                  ],
                ),
                itemOfContainer3("assets/images/mak_dars_img/11_sinf.png", Sinf(f: "11-sinf",tili: widget.tili,),widget.apbar,VariableAudioPages()),
              ],
            ),
          ],
        )
    );
  }
}
