// import 'dart:html';

import 'package:flutter/material.dart';

import 'oop_demo.dart';

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
      ),
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String data1 = "";
  String data2 = "";
  bool trick = false;
  @override
  Widget build(BuildContext context) {
    input1(String input) {
      setState(() {
        data1 = input;
        trick = false;
        print(input);
      });

      return 0;
    }

    pulse() {
      setState(() {
        trick = false;
      });

      return 0;
    }

    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          final_input_title(
            export_data: input1,
          ),
          SizedBox(
            child: InkWell(
                onTap: () {
                  setState(() {
                    trick = true;
                  });
                },
                child: Text("listen mode")),
            height: 20,
          ),
          SizedBox(
            height: 20,
          ),
          final_input_title(
            text_inject: data1,
            listen_mode: trick, //<---------------
            listen_pulse: pulse,
          ),
        ],
      )),
    );
  }
}
