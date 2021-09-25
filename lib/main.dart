import 'package:flutter/material.dart';
import 'package:page_transition/fade_transition_startup.dart';
import 'package:page_transition/scale_transition_startup.dart';
import 'package:page_transition/slide_transition_startup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Home")),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScaleTransitionStartUp(
                            child: Page2(),
                            duration: Duration(seconds: 2),
                          )));
                },
                child: Text("To Page "))));
  }
}

List<Color> colors = [
  Color(0xFF4e3066),
  Color(0xFF4a7988),
  Color(0xFF884a68),
  Color(0xFFa1c780),
  Color(0xFFc7af80),
  Color(0xFF595ead),
  Color(0xFF863c2c),
  Color(0xFFc9c654),
  Color(0xFF9c789b),
  Color(0xFF6e79b9),
];

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Page")),
        body: GridView.count(
          crossAxisCount: 2,
          children: colors.map((e) => Container(color: e)).toList(),
        ));
  }
}
