
import 'package:flutter/material.dart';
import 'package:online_darsliklar/pages/feed_page/1maktab_darsliklari/1maktab_darsliklari.dart';
import 'package:online_darsliklar/pages/feed_page/google_translate/google_tranlete.dart';
import 'package:online_darsliklar/pages/variable_page/variable_audio_page.dart';
import 'package:online_darsliklar/pages/variable_page/variable_page.dart';
import '../modellar/barchasi_uchun/itemofcontainer.dart';
import 'bilet_page/billet_page.dart';
import 'feed_page/11kundalikcom/11kundalikcom.dart';
import 'feed_page/Школьные_учебники/Школьные_учебники.dart';

class MyFeedPage extends StatefulWidget {
  const MyFeedPage({Key? key}) : super(key: key);

  @override
  State<MyFeedPage> createState() => _MyFeedPageState();
}

class _MyFeedPageState extends State<MyFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer("assets/images/feed_img/maktab_darsliklari.png","Darsliklar", const MaktabDarsliklari(apbar: "Darsliklar", f: 'Darsliklar',)),
                    itemOfContainer("assets/images/feed_img/maktab_darsliklari.png","Учебники",const ShkolniyeUchebniki()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer("assets/images/feed_img/sherlar.png","She'rlar",const VariablePages(f: "She'rlar",)),
                    itemOfContainer("assets/images/feed_img/detiktiv_hikoyalar.png","Detiktiv hikoyalar",const VariablePages(f: "Detiktiv hikoyalar",)),
                  ],

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer("assets/images/feed_img/romanlar.png","Romanlar",const VariablePages(f: "Romanlar",)),
                    itemOfContainer("assets/images/feed_img/ertaklar.png","Ertaklar",const VariablePages(f: "Ertaklar",)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer("assets/images/feed_img/testlar.png","Testlar",const VariablePages(f: "Testlar",)),
                    itemOfContainer("assets/images/feed_img/maqollar.png","Maqollar",const VariablePages(f: "Maqollar",)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer("assets/images/feed_img/lugatkitoblar.png","Lug'at Kitablar",const VariablePages(f: "Lug'at Kitablar")),
                    itemOfContainer("assets/images/feed_img/googletranslate.png","Google Translate",const TranslatePage()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer("assets/images/feed_img/kundalikcom.png","Kundalik.com",const KundalikcomPage()),
                    itemOfContainer("assets/images/feed_img/topishmoqlar.png","Topishmoqlar",const VariablePages(f: "Topishmoqlar",)),                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer("assets/images/feed_img/audiokitoblar.png","Audio Kitoblar",const VariableAudioPages( f: 'Audio Kitoblar',)),
                    itemOfContainer("assets/images/feed_img/diniykitoblar.png","Diniy Kitoblar", const VariablePages(f: "Diniy Kitoblar",)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer("assets/images/feed_img/yosh.jfif","Yosh kitobxon",const VariablePages(f: "Yosh kitobxon",)),
                    itemOfContainer("assets/images/feed_img/bilet.jpg","Bilet javoblari", const BiletJavoblar()),
                  ],
                ),
              ],
            ),
          ],
        )
    );
  }
}
