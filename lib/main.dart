import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime dateTime;
  TimeOfDay timeOfDay;

  getDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year),
        firstDate: DateTime(DateTime.now().year - 20),
        lastDate: DateTime(DateTime.now().year + 20));
    setState(() {
      dateTime = date;
    });
  }

  getTime() async {
    TimeOfDay time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      timeOfDay = time;
    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              dateTime == null
                  ? dateText("Choose date")
                  : dateText(
                      "${dateTime.day}/${dateTime.month}/${dateTime.year}"),
              RaisedButton(
                child: Text('Pick Time'),
                onPressed: () {
                  getDate();
                },
              ),
              SizedBox(
                height: 15,
              ),
              timeOfDay == null
                  ? dateText("Choose Time")
                  : dateText(
                  "${timeOfDay.hour}:${timeOfDay.minute}"),
              RaisedButton(
                child: Text('Pick Date'),
                onPressed: () {getTime();},
              ),
            ],
          ),
        ),
      ),
    );
  }


}

// ignore: camel_case_types
class dateText extends StatelessWidget {
  final String text;

  const dateText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}
