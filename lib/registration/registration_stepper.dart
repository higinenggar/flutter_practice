import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegistrationStep extends StatefulWidget {
  const RegistrationStep({Key? key}) : super(key: key);

  @override
  _RegistrationStepState createState() => _RegistrationStepState();
}

class _RegistrationStepState extends State<RegistrationStep> {
  int index = 0;
  int _currentStep = 0;
  bool isCompleted = false;
  bool isLoad = false;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final postcode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
        backgroundColor: Colors.indigo,
        leading: Icon(Icons.app_registration),
      ),
      body: isCompleted
          ? isLoad
              ? buildCompleted()
              : Center(
                  child: CircularProgressIndicator(
                    color: Colors.indigo,
                  ),
                )
          : Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(primary: Colors.indigo.shade400),
              ),
              child: Stepper(
                type: StepperType.horizontal,
                steps: getSteps(),
                currentStep: _currentStep,
                onStepContinue: () async {
                  final isLastStep = _currentStep == getSteps().length - 1;

                  if (isLastStep) {
                    setState(() => isCompleted = true);
                    await Future.delayed(Duration(seconds: 5));
                    setState(() => isLoad = true);
                    print('Send Data');
                    //send data
                  } else {
                    setState(() => _currentStep += 1);
                  }
                },
                onStepTapped: (step) => setState(() => _currentStep = step),
                onStepCancel: _currentStep == 0
                    ? null
                    : () => setState(() => _currentStep -= 1),
                controlsBuilder:
                    (BuildContext context, ControlsDetails controls) {
                  final isLastStep = _currentStep == getSteps().length - 1;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: controls.onStepContinue,
                          child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
                        ),
                        if (_currentStep != 0)
                          TextButton(
                            onPressed: controls.onStepCancel,
                            child: Text(
                              'BACK',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
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
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'First Name : ' + firstName.text,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                'Last Name : ' + lastName.text,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                'Email          : ' + email.text,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                'Address     : ' + address.text,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                'Postcode   : ' + postcode.text,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ];

  Widget buildCompleted() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: Column(
            children: [
              Text(
                'REGISTRATION COMPLETED',
                style: TextStyle(
                    color: Colors.indigo[300],
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Lottie.asset(
                'assets/json/23885-completed-happiness.json',
                repeat: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
