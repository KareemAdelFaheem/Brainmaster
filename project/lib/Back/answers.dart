import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  late double _deviceheight, _devicewidth, _sizedboxheight;
  //late Color c= Colors.black12;
  late String _answertext;
  final Function() x;
  Answers(this._answertext, this.x());
  @override
  Widget build(BuildContext context) {
    _deviceheight = MediaQuery.of(context).size.height;
    _devicewidth = MediaQuery.of(context).size.width;
    _sizedboxheight = 40;
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black12,
      ),
      width: _devicewidth,
      alignment: Alignment.centerLeft,
      child: MaterialButton(
        minWidth: _devicewidth,
        //color: Colors.black12,
        onPressed: () {
          x();
        },
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            _answertext,
            style: const TextStyle(
              fontFamily: "share",
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
