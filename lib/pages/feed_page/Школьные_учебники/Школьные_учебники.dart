// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../modellar/barchasi_uchun/itemofcontainer.dart';
import '../../variable_page/variable_sinf_page.dart';

class ShkolniyeUchebniki extends StatefulWidget {

  final String tili = "Учебники";

  const ShkolniyeUchebniki({Key? key, required,}) : super(key: key);

  @override
  State<ShkolniyeUchebniki> createState() => _ShkolniyeUchebnikiState();
}

class _ShkolniyeUchebnikiState extends State<ShkolniyeUchebniki> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.tili, style: TextStyle(color: Colors.black),),
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
                    itemOfContainer1("assets/images/mak_dars_img/1_sinf.png", Sinf(f: "1-класс", tili: widget.tili,)),
                    itemOfContainer1("assets/images/mak_dars_img/2_sinf.png", Sinf(f: "2-класс", tili: widget.tili,)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer1("assets/images/mak_dars_img/3_sinf.png", Sinf(f: "3-класс", tili: widget.tili,)),
                    itemOfContainer1("assets/images/mak_dars_img/4_sinf.png", Sinf(f: "4-класс", tili: widget.tili,)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer1("assets/images/mak_dars_img/5_sinf.png", Sinf(f: "5-класс",tili: widget.tili,)),
                    itemOfContainer1("assets/images/mak_dars_img/6_sinf.png", Sinf(f: "6-класс",tili: widget.tili,)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer1("assets/images/mak_dars_img/7_sinf.png", Sinf(f: "7-sinf",tili: widget.tili,)),
                    itemOfContainer1("assets/images/mak_dars_img/8_sinf.png", Sinf(f: "8-sinf",tili: widget.tili,)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer1("assets/images/mak_dars_img/9_sinf.png",Sinf(f: "9-класс",tili: widget.tili,)),
                    itemOfContainer1("assets/images/mak_dars_img/10_sinf.png",Sinf(f: "10-класс",tili: widget.tili,)),
                  ],
                ),
                itemOfContainer1("assets/images/mak_dars_img/11_sinf.png", Sinf(f: "11-класс",tili: widget.tili,)),
              ],
            ),
          ],
        )
    );
  }
}
