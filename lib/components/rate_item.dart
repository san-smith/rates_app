import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:rates_app/models/rate.dart';
import 'package:intl/intl.dart';
import 'package:rates_app/screens/detail.dart';
import 'package:rates_app/components/scale_route.dart';
import 'package:rates_app/models/provider.dart';
import 'package:provider/provider.dart';

var formatter = DateFormat('dd.MM.yyyy');

class RateItem extends StatelessWidget {
  final Rate item;

  RateItem({this.item});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => goToDetail(context, item),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 80,
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Color(0xaa272e47).withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Row(
              children: <Widget>[
                left(),
                center(),
                right(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  left() {
    return Container(
      width: 100,
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            item.code,
            style: TextStyle(
              color: Color(0xffcccccc),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            item.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xff999999),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  center() {
    return Container(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '${item.value.toStringAsFixed(2)}',
              style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  right() {
    var diff = item.value - item.previous;
    var percent = (item.value / item.previous - 1) * 100;
    return Container(
      height: 40,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color(diff >= 0 ? 0xff23cc9c : 0xfff26560),
      ),
      margin: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '${diff.toStringAsFixed(4)}',
            style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${percent.toStringAsFixed(2)} %',
            style: TextStyle(
              color: Color(0xffeeeeee),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  goToDetail(BuildContext context, Rate rate) {
    Provider.of<RateProvider>(context).setCurrentRate(rate);
    Navigator.of(context).push<void>(ScaleRoute(page: DetailScreen()));
  }
}
