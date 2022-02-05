import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class BottomAnimBar extends StatefulWidget {
  const BottomAnimBar({Key? key}) : super(key: key);

  @override
  _BottomAnimBarState createState() => _BottomAnimBarState();
}

class _BottomAnimBarState extends State<BottomAnimBar> {
  int index = 0;
  int _currentStep = 0;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final postcode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPages(),
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Widget buildBottomNavigation() {
    final inactiveColor = Colors.grey;
    return BottomNavyBar(
      selectedIndex: index,
      onItemSelected: (index) => setState(() => this.index = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          textAlign: TextAlign.center,
          activeColor: Colors.indigo,
          inactiveColor: inactiveColor,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.search),
          title: Text('Search'),
          textAlign: TextAlign.center,
          activeColor: Colors.redAccent,
          inactiveColor: inactiveColor,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.video_camera_back),
          title: Text('Live'),
          textAlign: TextAlign.center,
          activeColor: Colors.teal,
          inactiveColor: inactiveColor,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
          textAlign: TextAlign.center,
          activeColor: Colors.cyan,
          inactiveColor: inactiveColor,
        ),
      ],
    );
  }

  Widget buildPages() {
    switch (index) {
      case 1:
        return Scaffold(
          appBar: AppBar(
            title: Text('Search'),
            backgroundColor: Colors.red,
            centerTitle: true,
          ),
          body: Center(
            child: Text(
              'Search',
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
        );
      case 2:
        return Scaffold(
          appBar: AppBar(
            title: Text('Live'),
            backgroundColor: Colors.teal,
            centerTitle: true,
          ),
          body: Center(
            child: Text(
              'Live Stream',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan),
            ),
          ),
        );

      case 3:
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
            backgroundColor: Colors.cyan,
            centerTitle: true,
          ),
          body: Center(
            child: Text(
              'Profile',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan),
            ),
          ),
        );
      case 0:
      default:
        return Scaffold(
          appBar: AppBar(
            title: Text('Home'),
            backgroundColor: Colors.indigo,
            centerTitle: true,
          ),
          body: Center(
            child: Text(
              'Home',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            ),
          ),
        );
    }
  }

  List<Step> getSteps() => [
        Step(
          state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 0,
          title: Text('Account'),
          content: Column(
            children: <Widget>[
              TextFormField(
                controller: firstName,
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              TextFormField(
                controller: lastName,
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(labelText: 'Your Email'),
              ),
            ],
          ),
        ),
        Step(
          state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 1,
          title: Text('Address'),
          content: Column(
            children: <Widget>[
              TextFormField(
                controller: address,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              TextFormField(
                controller: postcode,
                decoration: InputDecoration(labelText: 'Post Code'),
              ),
            ],
          ),
        ),
        Step(
          isActive: _currentStep >= 2,
          title: Text('Complete'),
          content: Container(),
        ),
      ];
}
