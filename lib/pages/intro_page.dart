
import 'package:flutter/material.dart';
import 'package:online_darsliklar/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  Widget buildPage({
    required Color color,
    required String image,
    required String title,
    required String subtitle,
   }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(height: 64,),
            Text(
              title,
              style: TextStyle(
                color: Colors.teal.shade700,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24,),
            Container(
              padding: const EdgeInsets.symmetric(),
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.black45)
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          controller: controller,
          children: [
            buildPage(
              color: Colors.green.shade100,
              image: "assets/images/splash_page/image1.png",
              title: "Reduce",
              subtitle: "2121212121212121212"
            ),
            buildPage(
                color: Colors.green.shade100,
                image: "assets/images/splash_page/image2.png",
                title: "Reduce",
                subtitle: "kdugugfjsvcjhdvf"
            ),
            buildPage(
                color: Colors.green.shade100,
                image: "assets/images/splash_page/image3.png",
                title: "Reduce",
                subtitle: "djkgfmsddgyesgfes"
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
        ? TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          primary: Colors.white,
          backgroundColor: Colors.teal.shade700,
          minimumSize: const Size.fromHeight(80,)
        ),
        child: const Text(
          "Get Started",
          style: TextStyle(fontSize: 24),
        ),
        onPressed: () async {

          final prefs = await SharedPreferences.getInstance();
          prefs.setBool("showHome", true);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
      ) : Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => controller.jumpToPage(2),
              child: const Text("SKIP"),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.black26,
                  activeDotColor: Colors.teal.shade700,
                ),
                onDotClicked: (index) => controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn
                ),
              ),
            ),
            TextButton(
              onPressed: () => controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut
              ),
              child: const Text("NEXT"),
            ),
          ],
        ),
      ),
    );
  }
}
