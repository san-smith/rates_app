import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rates_app/models/provider.dart';
import 'package:rates_app/consts.dart';
import 'dart:ui';
import 'package:rates_app/components/header_image.dart';
import 'package:rates_app/models/rate.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var rate = Provider.of<RateProvider>(context).currentrate;
    return Scaffold(
      appBar: buildAppBar(rate),
      backgroundColor: Theme.of(context).backgroundColor,
      body: FractionallySizedBox(
        heightFactor: 1,
        child: Stack(
          children: <Widget>[
            HeaderImage(
              height: 150,
            ),
            Positioned.fill(
              child: ListView(
                children: <Widget>[
                  buildCard(rate),
                  buildDescription(rate),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildAppBar(Rate rate) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        rate.name,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  buildCard(Rate rate) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: 200,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Color(0xaa272e47).withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: <Widget>[buildLeft(), buildCenter(rate), buildRight()],
          ),
        ),
      ),
    );
  }

  buildLeft() {
    return Container(
      width: 50,
      child: Icon(
        Icons.payment,
        color: Colors.white,
      ),
    );
  }

  buildCenter(Rate rate) {
    return Container(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              rate.value.toStringAsFixed(4),
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Вчера: ${rate.previous.toStringAsFixed(4)}',
                  style: TextStyle(
                    color: Color(0xffdddddd),
                    fontSize: 12,
                  ),
                ),
                rate.value - rate.previous >= 0
                    ? Icon(
                        Icons.arrow_drop_up,
                        color: Theme.of(context).primaryColor,
                      )
                    : Icon(
                        Icons.arrow_drop_down,
                        color: Theme.of(context).accentColor,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildRight() {
    return Container(
      width: 50,
      child: Text(
        'руб.',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  buildDescription(Rate rate) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Text(
        RATES_DESC[rate.code] != null ? RATES_DESC[rate.code] : 'Нет данных',
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: Color(0xffdddddd),
          fontSize: 14,
        ),
      ),
    );
  }
}
