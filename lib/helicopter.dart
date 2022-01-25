import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HelicopterPage extends StatefulWidget {
  const HelicopterPage({Key? key}) : super(key: key);

  @override
  _HelicopterPageState createState() => _HelicopterPageState();
}

class _HelicopterPageState extends State<HelicopterPage> {
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
                'READY TO CAPPADOCIA',
                style: TextStyle(
                  fontFamily: 'Vcr',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.red,
                ),
              ),
              Lottie.asset(
                'assets/json/47128-helicopter.json',
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
              ),
              Text(
                'Enjoy Your Food',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.green[700],
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
