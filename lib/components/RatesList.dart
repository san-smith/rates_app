import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:rates_app/models/rate.dart';

class RatesList extends StatelessWidget {
  final List<Rate> list;

  RatesList({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (BuildContext context, int index) {
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
                    'Entry ${list[index].code}',
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
        });
  }
}
