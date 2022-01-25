import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class FoodOrderPage extends StatefulWidget {
  const FoodOrderPage({Key? key}) : super(key: key);

  @override
  _FoodOrderPageState createState() => _FoodOrderPageState();
}

class _FoodOrderPageState extends State<FoodOrderPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  int completed = 0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
    );

    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        controller.reset();
        setState(() => completed = 1);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text('Delivery Order'),
          centerTitle: true,
          backgroundColor: Colors.orange[400],
          actions: [
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'DRIVER IS ON THE WAY',
                style: TextStyle(
                  fontFamily: 'Vcr',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.orange,
                ),
              ),
              Lottie.asset(
                'assets/json/21653-delivery.json',
              ),
              SizedBox(
                height: 32,
              ),
              LinearPercentIndicator(
                animation: true,
                animationDuration: 9500,
                lineHeight: 30,
                percent: 1,
                progressColor: Colors.orange,
                backgroundColor: Colors.orange[200],
                barRadius: Radius.circular(20),
                onAnimationEnd: () => showDoneDialog(),
                center: (completed == 1)
                    ? Text(
                        'Your Order Was Delivered',
                        style: (TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                      )
                    : Text(
                        'Your Order Almost There...',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ],
          ),
        ),
      );

  void showDoneDialog() => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/json/972-done.json',
                repeat: false,
                controller: controller,
                onLoaded: (composition) {
                  controller.duration = composition.duration;
                  controller.forward();
                },
              ),
              Text(
                'Enjoy Your Food',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
}
