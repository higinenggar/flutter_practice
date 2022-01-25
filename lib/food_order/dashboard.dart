import 'package:flutter/material.dart';
import 'package:flutter_practice/food_order/food_order_anim.dart';

class HomeOrderPage extends StatefulWidget {
  const HomeOrderPage({Key? key}) : super(key: key);

  @override
  _HomeOrderPageState createState() => _HomeOrderPageState();
}

class _HomeOrderPageState extends State<HomeOrderPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

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
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  textStyle: TextStyle(fontSize: 20),
                ),
                icon: Icon(Icons.delivery_dining_rounded, size: 30),
                label: Text(
                  'CONFIRM ORDER',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FoodOrderPage()));
                },
              ),
            ],
          ),
        ),
      );
}
