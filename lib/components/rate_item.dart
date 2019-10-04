import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:rates_app/models/rate.dart';

class RateItem extends StatelessWidget {
  final Rate item;

  RateItem({this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: new Container(
          height: 80,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: new BoxDecoration(
            color: Color(0xaa272e47).withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(2.5)),
          ),
          child: new Center(
            child: new Text(
              'Entry ${item.code}',
              style: TextStyle(
                color: Color(0xfff8ffff),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
