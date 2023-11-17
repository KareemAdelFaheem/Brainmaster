import 'package:flutter/material.dart';
import 'package:project/Pages/Questionpage.dart';

class dark {
  questionscreenState q = questionscreenState();
  Color backgroundcolor = const Color.fromRGBO(255, 193, 92, 1.0);
  Color textcolor = const Color.fromRGBO(176, 168, 158, 1.0);
  Color backgrounddark = Colors.white;
  Color frontdark = Colors.white;
  Color normaltext = Colors.black;
  String path = 'assets/images/background.jpg';
  double opacity = 0.2;
  double imagepadding = 0;
  Widget backimage(String p, double o, double pad) {
    p = path;
    o = opacity;
    pad = imagepadding;
    return Container(
      padding: EdgeInsets.only(top: pad),
      //height: q.getdeviceheight(),
      //color: Colors.red,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            p,
            fit: BoxFit.cover,
            opacity: AlwaysStoppedAnimation(o),
          ),
        ],
      ),
    );
  }

  darktheme(bool switched) {
    if (switched) {
      backgrounddark = const Color.fromARGB(255, 18, 18, 18);
      frontdark = const Color.fromARGB(255, 29, 29, 29);
      textcolor = const Color.fromARGB(255, 248, 230, 208);
      normaltext = Colors.white;
      path = 'assets/images/moon.jpg';
      opacity = 1;
      imagepadding = 70;
      backgroundcolor = const Color.fromARGB(255, 6, 23, 33);
    } else {
      backgrounddark = Colors.white;
      frontdark = Colors.white;
      textcolor = const Color.fromRGBO(176, 168, 158, 1.0);
      normaltext = Colors.black;
      path = 'assets/images/background.jpg';
      opacity = 0.2;
      imagepadding = 0;
      backgroundcolor = const Color.fromRGBO(255, 193, 92, 1.0);
    }
  }
}
