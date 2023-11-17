import 'package:flutter/material.dart';
import 'package:project/Pages/Questionpage.dart';
import 'package:project/Pages/Result.dart';
import 'package:project/Pages/mainscreen.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(App());
}

late int lastscore = 0;
void navigatetoscreen(BuildContext context, x, int data) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => x));
  lastscore = data;
}

class App extends StatefulWidget {
  App({Key? k}) : super(key: k);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Brainmaster",
      theme: ThemeData(
          //scaffoldBackgroundColor: Colors.white,
          //const Color.fromRGBO(255, 193, 92, 1.0)
          ),
      home: mainscreen(),
    );
  }
}
