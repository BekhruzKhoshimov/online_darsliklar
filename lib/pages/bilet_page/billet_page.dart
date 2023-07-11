// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../modellar/barchasi_uchun/itemofcontainer.dart';
import '../variable_page/variable_sinf_page.dart';

class BiletJavoblar extends StatefulWidget {
  final String tili = "Bilet javoblari";

  const BiletJavoblar({
    Key? key,
    required,
  }) : super(key: key);

  @override
  State<BiletJavoblar> createState() => _BiletJavoblarState();
}

class _BiletJavoblarState extends State<BiletJavoblar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            widget.tili,
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer(
                      "assets/images/mak_dars_img/9_sinf.png",
                      "SAVOLLAR",
                      Sinf(
                        f: "9-sinf",
                        tili: widget.tili,
                      ),
                    ),
                    itemOfContainer(
                        "assets/images/mak_dars_img/11_sinf.png",
                        "SAVOLLAR",
                        Sinf(
                          f: "11-sinf",
                          tili: widget.tili,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer(
                        "assets/images/mak_dars_img/9_sinf.png",
                        "JAVOBLAR+",
                        Sinf(
                          f: "9-sinf",
                          tili: widget.tili,
                        )),
                    itemOfContainer(
                        "assets/images/mak_dars_img/11_sinf.png",
                        "JAVOBLAR",
                        Sinf(
                          f: "11-sinf",
                          tili: widget.tili,
                        )),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
