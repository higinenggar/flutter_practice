import 'package:flutter/material.dart';
import 'package:flutter_practice/onboard/model.dart';
import 'package:flutter_practice/registration/registration_stepper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final controller = PageController();
  bool isLastPage = false;

  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
          height: 20,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() => isLastPage = index == 2);
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        contents[i].image,
                        height: 300,
                      ),
                      Text(
                        contents[i].titleone,
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo[900],
                        ),
                      ),
                      Text(
                        contents[i].titletwo,
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange[400],
                        ),
                      ),
                      Text(
                        contents[i].titlethree,
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo[900],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        contents[i].discription,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.indigo[200],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomSheet: isLastPage
          ? Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
              ),
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          primary: Colors.white,
                          backgroundColor: Colors.indigo[600],
                          minimumSize: const Size(350, 70),
                          elevation: 20,
                        ),
                        child: const Text(
                          'Login Now',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => RegistrationStep()),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        child: const Text(
                          "Don't Have Account",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => RegistrationStep()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text(
                      'SKIP',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () => controller.jumpToPage(2),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      count: 3,
                      controller: controller,
                      effect: WormEffect(
                        dotWidth: 13.0,
                        dotHeight: 13.0,
                        spacing: 16,
                        dotColor: Colors.grey,
                      ),
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'NEXT',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () => controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
