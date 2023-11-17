import 'package:flutter/material.dart';
import 'package:project/Back/answers.dart';
import 'package:project/Back/darktheme.dart';
import 'package:project/Pages/Result.dart';
import 'package:project/main.dart';
import 'mainscreen.dart';
import 'package:project/Back/questions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class questionscreen extends StatefulWidget {
  @override
  State<questionscreen> createState() => questionscreenState();
}

bool _showwidget = false;

class questionscreenState extends State<questionscreen> {
  void setdata(int s) async {
    SharedPreferences score = await SharedPreferences.getInstance();
    setState(() {
      score.setInt("score", s);
    });
  }

  getdata() async {
    SharedPreferences score = await SharedPreferences.getInstance();
    setState(() {
      finalscore = score.getInt("score");
    });
  }

  questionlist q = questionlist();
  late double _deviceheight, _devicewidth, _sizedboxheight;
  late BuildContext cxt;
  bool isbuttonenabled = false;

  void questionanswer(int score) {
    q.setScore(score);
    if (q.getIndex() != q.questions.length) {
      setState(() {
        q.setIndex();
      });
      if (q.getIndex() >= q.questions.length) {
        q.outofboundIndex();
      }
      // print("index: ${q.getIndex()}");
      print("score: ${q.getScore()}");
    }
  }

  void resetquiz() {
    setState(() {
      q.zeroIndex();
      q.zeroScore();
    });
  }

  @override
  Widget build(BuildContext context) {
    cxt = context;
    if (q.getIndex() == q.questions.length - 1) {
      setState(() {
        isbuttonenabled = true;
      });
    }
    _deviceheight = MediaQuery.of(context).size.height;
    _devicewidth = MediaQuery.of(context).size.width;

    _sizedboxheight = 40;
    return Scaffold(
        body: Stack(
      children: [
        headerandbottomsheet(),
        mathbackground(),
        Questionfield(),
      ],
    ));
  }

  Widget headerandbottomsheet() {
    return SafeArea(
        bottom: false,
        child: Stack(children: [
          Container(
            width: _devicewidth,
            height: _deviceheight,
            color: const Color.fromRGBO(255, 193, 92, 1.0),
          ),
          Container(
            width: _devicewidth,
            //color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 15,
                  ),
                  child: const Text(
                    "BRAINMASTER",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "nasa",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: _deviceheight * 0.85,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(41))),
                ),
              ],
            ),
          ),
        ]));
  }

  Widget mathbackground() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: _deviceheight * 0.15),
      height: _deviceheight * 0.85,
      // padding: EdgeInsets.only(top: 150),
      //color: Colors.red,
      child: Opacity(
          opacity: 0.1, child: Image.asset("assets/images/mathbackground.png")),
    );
  }

  Widget Questionfield() {
    void delaytime() {
      setState(() {
        _showwidget = true;
      });
    }

    //print(q.questions.length);
    late Color c, x;

    if (q.getIndex() == q.questions.length - 1) {
      c = const Color.fromARGB(255, 249, 79, 70);
      //x = null;
    } else {
      c = const Color.fromARGB(255, 255, 166, 161);
    }

    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 5), () {
          delaytime();
        }),
        builder: (ctx, snapshot) {
          return _showwidget
              ? Container(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, bottom: 30, top: 30),
                  margin: EdgeInsets.only(
                    top: _deviceheight * 0.18,
                  ),
                  height: _deviceheight * 0.8,
                  width: _devicewidth,
                  //color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        q.questions[q.getIndex()]['questiontext'].toString(),
                        style: const TextStyle(
                            fontSize: 30,
                            fontFamily: "share",
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        //color: Colors.green,
                        child: Column(children: [
                          ...(q.questions[q.getIndex()]['answers']
                                  as List<Map<String, Object>>)
                              .map((answer) {
                            return Answers(
                                answer['text'].toString(),
                                () => questionanswer(
                                    int.parse(answer['score'].toString())));
                          }).toList()
                        ]),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                            color: c,
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
                          onPressed: isbuttonenabled
                              ? () {
                                  navigatetoscreen(cxt, result(), q.getScore());
                                  print(q.getScore());
                                  setdata(q.getScore());
                                  getdata();
                                }
                              : null,

                          child: const Text(
                            "RESULT >>",
                            style: TextStyle(
                              //fontSize: 15,
                              fontWeight: FontWeight.w900,
                              fontFamily: "nasa",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SafeArea(
                  child: Center(
                    child: StreamBuilder(
                        stream: Stream.periodic(const Duration(seconds: 1),
                            (count) {
                          return count;
                        }),
                        builder: (ctx, snapchot) {
                          if (snapchot.data == 0) {
                            return const Text(
                              '3',
                              style:
                                  TextStyle(fontSize: 60, fontFamily: 'nasa'),
                            );
                          } else if (snapchot.data == 1) {
                            return const Text(
                              '2',
                              style:
                                  TextStyle(fontSize: 60, fontFamily: 'nasa'),
                            );
                          } else if (snapchot.data == 2) {
                            return const Text(
                              '1',
                              style:
                                  TextStyle(fontSize: 50, fontFamily: 'nasa'),
                            );
                          } else if (snapchot.data == 3) {
                            return const Text(
                              "Let's Start",
                              style:
                                  TextStyle(fontSize: 60, fontFamily: 'nasa'),
                            );
                          } else {
                            return Container();
                          }
                        }),
                  ),
                );
        });
  }
}
