import 'package:flutter/material.dart';
import 'package:project/Pages/mainscreen.dart';
import 'Questionpage.dart';
import 'package:project/Back/questions.dart';
import 'package:project/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
class result extends StatefulWidget {
  
  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {


  late double _deviceheight, _devicewidth, _sizedboxheight;

  Widget build(BuildContext context) {
    _deviceheight = MediaQuery.of(context).size.height;
    _devicewidth = MediaQuery.of(context).size.width;
    _sizedboxheight = 30;
    return Scaffold(
      body: Container(
        child: Container(
          color: const Color.fromRGBO(255, 193, 92, 1.0),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(bottom: 30),
              width: _devicewidth,
              // alignment: Alignment.center,
              //color: Colors.blue,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "YOU WIN!",
                      style: TextStyle(
                          fontSize: 70,
                          fontFamily: "nasa",
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      "assets/images/win.png",
                      scale: 0.5,
                    ),
                    Text(
                      "You earned $lastscore Free coins",
                      style: const TextStyle(
                          fontSize: 25,
                          fontFamily: "share",
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: _devicewidth * 0.8,
                      // padding: const EdgeInsets.symmetric(horizontal: 60),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0, 4),
                                blurRadius: 4.0,
                                spreadRadius: 0.0)
                          ]),
                      child: MaterialButton(
                        minWidth: _devicewidth,
                        //color: const Color.fromARGB(255, 249, 79, 70),
                        onPressed: () {},
                        child: const Text(
                          "SHARE WITH FRIENDS",
                          style: TextStyle(
                            //fontSize: 15,
                            fontWeight: FontWeight.w900,
                            fontFamily: "nasa",
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: _devicewidth * 0.8,
                      //padding: const EdgeInsets.symmetric(horizontal: 105),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 249, 79, 70),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0, 4),
                                blurRadius: 4.0,
                                spreadRadius: 0.0)
                          ]),
                      child: MaterialButton(
                        minWidth: _devicewidth,
                        //color: const Color.fromARGB(255, 249, 79, 70),
                        onPressed: () {
                          navigatetoscreen(context, mainscreen(), 0);
                        },
                        child: const Text(
                          "NEW QUIZ",
                          style: TextStyle(
                            //fontSize: 15,
                            fontWeight: FontWeight.w900,
                            fontFamily: "nasa",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
