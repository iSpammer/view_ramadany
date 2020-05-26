import 'package:flutter/material.dart';

import '../main.dart';

class Button extends StatelessWidget {
  Color bgColor = Colors.white;
  Color txtColor = darkModeOn ? Colors.black : Colors.white;
  final String text;
  final Function fn;
  Button({@required this.text, this.bgColor, this.txtColor, @required this.fn});

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    return
      Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: bgColor,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: fn,
          child: Text(text,
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: txtColor, fontWeight: FontWeight.bold)),
        ),
      );




  }
}
