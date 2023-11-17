import 'package:flutter/material.dart';
import 'package:project/Pages/Questionpage.dart';
import 'package:project/main.dart';
import 'package:project/Back/darktheme.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class mainscreen extends StatefulWidget {
  @override
  State<mainscreen> createState() => _mainscreenState();
}

var finalscore;

class _mainscreenState extends State<mainscreen> {
  bool isSwitched = false;
  dark d = dark();
  late double _deviceheight, _devicewidth;
  late BuildContext cxt;
  Widget build(BuildContext context) {
    _deviceheight = MediaQuery.of(context).size.height;
    _devicewidth = MediaQuery.of(context).size.width;
    cxt = context;
    return Scaffold(
        body: Stack(
      children: [
        sunray(),
        cloudsandbottomsheet(),
        bottomsheetcontent(),
        hellotext(),
        pointsfloat(),
        darkthemeswitch(),
      ],
    ));
  }

  Widget sunray() {
    return Stack(children: [
      Container(
        width: _devicewidth,
        height: _deviceheight,
        color: d.backgroundcolor,
      ),
      Container(
        child: d.backimage(d.path, d.opacity, d.imagepadding),
      ),
    ]);
  }

  Widget darkthemeswitch() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.topRight,
        // color: Colors.blue,
        child: Switch(
          activeColor: const Color.fromARGB(255, 249, 79, 70),
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
              print(isSwitched);
              d.darktheme(isSwitched);
            });
          },
        ),
      ),
    );
  }

  Widget cloudsandbottomsheet() {
    return SafeArea(
      child: Container(
        //color: Colors.red,
        //height: _deviceheight * 0.3,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/cloud.png',
                  scale: 15,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 73),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/cloud.png',
                    scale: 9,
                  )
                ],
              ),
            ),
            Container(
                height: _deviceheight * 0.62,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(41)),
                  color: d.backgrounddark,
                )),
          ],
        ),
      ),
    );
  }

  Widget hellotext() {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.only(top: 80),
      margin: const EdgeInsets.only(left: 20),
      //color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "WELCOME BACK, ",
            style: TextStyle(
                color: d.textcolor,
                fontSize: 18,
                fontFamily: "share",
                fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Let's Play",
            style: TextStyle(
              color: d.normaltext,
              fontWeight: FontWeight.w900,
              fontFamily: "nasa",
              fontSize: 30,
            ),
          )
        ],
      ),
    ));
  }

  Widget startbutton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60),
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
        //color: const Color.fromARGB(255, 249, 79, 70),
        onPressed: () {
          navigatetoscreen(cxt, questionscreen(), 0);
        },
        child: const Text(
          "START A NEW GAME",
          style: TextStyle(
            //fontSize: 15,
            fontWeight: FontWeight.w900,
            fontFamily: "nasa",
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget bottomsheetcontent() {
    //this layer containes typography, illustrations, buttons, icons
    return Opacity(
      opacity: 1,
      child: Container(
        width: _devicewidth,
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
        margin: EdgeInsets.only(top: _deviceheight * 0.4),
        height: _deviceheight * 0.6,
        //color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              width: 180,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 4),
                      blurRadius: 4.0,
                      spreadRadius: 0.0)
                ],
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromRGBO(33, 160, 170, 1.0),
              ),
              child: const Text(
                "Level 0",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "nasa",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              'assets/images/thinking2.png',
              scale: 6,
            ),
            startbutton(),
          ],
        ),
      ),
    );
  }

  Widget pointsfloat() {
    if (finalscore == null) {
      finalscore = 0;
    }

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(bottom: 275),
        width: _devicewidth,
        //color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: d.frontdark,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 4),
                          blurRadius: 15.0,
                          spreadRadius: 0.0)
                    ]),
                alignment: Alignment.centerLeft,
                width: _devicewidth * 0.866,
                height: _deviceheight * 0.11,
                child: Row(
                  children: [
                    Text(
                      "Points ",
                      style: TextStyle(
                        fontSize: 36,
                        color: d.textcolor,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text(
                            "  $finalscore/",
                            style: TextStyle(
                              color: d.normaltext,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "130",
                            style: TextStyle(
                              color: d.textcolor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 25),
                        child: Image.asset(
                          'assets/images/coins.png',
                          scale: 7,
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
