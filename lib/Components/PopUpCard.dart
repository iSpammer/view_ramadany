import 'package:fab_menu_items/fab_menu_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viewramadany/Utils/const.dart';

import '../main.dart';

class PopUpCard extends StatefulWidget {
  @override
  _PopUpCardState createState() => _PopUpCardState();
}

class _PopUpCardState extends State<PopUpCard> {
  @override
  Widget build(BuildContext context) {
    return Fabmenuitems(
      height: 510,
      weith: 320,
      animatedIcons: AnimatedIcons.menu_close,
      fabcolor: darkModeOn ? Colors.white30 : Colors.black,
      containercolor: darkModeOn ? Colors.white30 : Colors.white,
      childrens: <Widget>[
        Divider(),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.bubble_chart,
                size: 24,
                color: Colors.indigo,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Azan Al Fagr: 3:14AM",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.bubble_chart,
                size: 24,
                color: Colors.indigo,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "Azan Al Shourouk: 4:56AM",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ))
            ],
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.bubble_chart,
                size: 24,
                color: Colors.indigo,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "Azan Al Dhuhur: 11:52AM",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ))
            ],
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.bubble_chart,
                size: 24,
                color: Colors.indigo,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "Azan Al Asr: 3:29PM",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ))
            ],
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.bubble_chart,
                size: 24,
                color: Colors.indigo,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "Azan Al Maghrib: 6:48PM",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ))
            ],
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.bubble_chart,
                size: 24,
                color: Colors.indigo,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "Azan Al Isha: 8:19PM",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ))
            ],
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.bubble_chart,
                size: 24,
                color: Colors.indigo,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "Azan Al Qiyam: 12:24AM",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ))
            ],
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.update,
                size: 24,
                color: Colors.indigo,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "Updates",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ))
            ],
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.contacts,
                size: 24,
                color: Colors.indigo,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "Contact Us",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ))
            ],
          ),
        ),
      ],
    );
  }
}
