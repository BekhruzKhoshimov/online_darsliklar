
import 'dart:ui';
import 'package:dash_flags/dash_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:online_darsliklar/pages/feed_page/11kundalikcom/11kundalikcom.dart';
import 'package:online_darsliklar/pages/intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'myfeed_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SliderDrawer(
            appBar: SliderAppBar(
                appBarHeight: 90,
                appBarColor: Colors.white,
                title: const Text("online", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)).tr()),
            slider: Stack(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Image(
                        height: MediaQuery.of(context).size.height/1.4,
                        image: const AssetImage("assets/images/home_img/1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 12,
                          sigmaY: 12,
                        ),
                        child: Container(
                          color: Colors.black.withOpacity(0),
                        )
                    ),
                  ],
                ),
                SafeArea(
                  child: Container(
                    width: 200,
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        DrawerHeader(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Image(image: AssetImage("assets/images/home_img/111.png"),)
                              ),
                              const SizedBox(height: 10,),
                              const Text("menu",style: TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              ListTile(
                                onTap: (){
                                  Get.to(const HomePage());
                                },
                                leading: const Icon(Icons.home, color: Colors.white,),
                                title: const Text("Home",style: TextStyle(color: Colors.white),),
                              ),
                              ListTile(
                                onTap: (){
                                  Get.to(const KundalikcomPage());
                                },
                                leading: const Icon(Icons.book_rounded, color: Colors.white,),
                                title: const Text("Kundalik",style: TextStyle(color: Colors.white),),
                              ),
                              ListTile(
                                onTap: ()async{
                                  await context.setLocale(const Locale("uz","UZ"));
                                },
                                leading: LanguageFlag(
                                  language: Language.uz,
                                  height: 23,
                                ),
                                title: const Text("O'zbek Tili",style: TextStyle(color: Colors.white),),
                              ),
                              ListTile(
                                onTap: ()async{
                                  await context.setLocale(const Locale("ru","RU"));
                                },
                                leading: LanguageFlag(
                                  language: Language.ru,
                                  height: 23,
                                ),
                                title: const Text("Rus tili",style: TextStyle(color: Colors.white),),
                              ),
                              ListTile(
                                onTap: ()async{
                                  final prefs = await SharedPreferences.getInstance();
                                  prefs.setBool("showHome", false);

                                  Get.to(const IntroPage());
                                },
                                leading: const Icon(Icons.logout, color: Colors.white,),
                                title: const Text("Log out",style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            child: Stack(
              children: const [
                Scaffold(
                  body: MyFeedPage(),
                )
              ],
            )
        ));
  }
}