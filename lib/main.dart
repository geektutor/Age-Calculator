import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

int age = 0;
var yearOfBirth = '0';

class _MyAppState extends State<MyApp> {
  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1990, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        selectedDate.year;
        age = 2020 - selectedDate.year;
        print(age);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Age Calculator'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${selectedDate.toLocal()}".split(' ')[0]),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Select date'),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text('You are $age years old'),
          ),
        ],
      ),
    );
  }
}
