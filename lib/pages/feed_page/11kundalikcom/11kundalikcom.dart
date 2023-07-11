
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_darsliklar/pages/home_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KundalikcomPage extends StatefulWidget {

  const KundalikcomPage({Key? key}) : super(key: key);

  @override
  State<KundalikcomPage> createState() => _KundalikcomPageState();
}

class _KundalikcomPageState extends State<KundalikcomPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("KUNDALIKCOM", style: TextStyle(color: Colors.black),),
          leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: const Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),
          ),
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer("assets/images/kundalikcom/kundalik.png","Kundalik","https://kundalik.com/userfeed"),
                    itemOfContainer("assets/images/kundalikcom/mening_maktabim.png","Mening maktabim","https://schools.kundalik.com/school.aspx?school"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer("assets/images/kundalikcom/sinf.png","Mening sinflarim","https://schools.kundalik.com/class.aspx"),
                    itemOfContainer("assets/images/kundalikcom/dostlar.png","Do'stlar","https://kundalik.com/user/user.aspx?user=1000008227862&view=friends"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemOfContainer("assets/images/kundalikcom/sozlamalar.png","Sozlamalar","https://kundalik.com/user/settings.aspx?user"),
                    itemOfContainer("assets/images/kundalikcom/qollanmalar.png","Qo'llanmalar","https://help.kundalik.com/hc/ru"),
                  ],
                ),
              ],
            ),
          ],
        )
    );
  }

  Widget itemOfContainer(rasmi,nomi,site){
    return Container(
      color: Colors.transparent,
      child: Center(
          child: GestureDetector(
              onTap: (){
                Get.to(itemofweb(site, nomi));
              },
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.blueAccent,
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: Offset(4,4),
                            ),
                            BoxShadow(
                              color: Colors.transparent,
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: Offset(-4,-4),
                            )
                          ]
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(image: AssetImage(rasmi,),)
                            ),
                          ),
                          Text(nomi, style: const TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 18),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )
                  ),
                  const SizedBox(height: 10,),
                ],
              )
          )
      ),
    );
  }

  Widget itemofweb(site, nomi){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  Text(nomi, style: const TextStyle(color: Colors.black),),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => KundalikcomPage()));
          },
          icon: const Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),
        ),
      ),
      body: WebViewWidget(
          controller:  WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                  // Update loading bar.
                },
                onPageStarted: (String url) {},
                onPageFinished: (String url) {},
                onWebResourceError: (WebResourceError error) {},
                onNavigationRequest: (NavigationRequest request) {
                  if (request.url.startsWith('https://www.youtube.com/')) {
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
              ),
            )
            ..loadRequest(Uri.parse('$site'))
      ),
    );
  }
}
