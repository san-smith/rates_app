import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:rates_app/components/rates_list.dart';
import 'package:rates_app/api/api.dart';
import 'package:rates_app/models/rate.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Rate> rateList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: FractionallySizedBox(
        heightFactor: 1,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/header.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: RatesList(
                list: rateList,
              ),
            ),
          ],
        ),
      ),
    );
  }

  getJSONData() async {
    try {
      var response =
          await getRates(date: DateTime.now().subtract(Duration(days: 1)));
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON.
        var decoded = json.decode(response.body);
        var rates = Map<String, dynamic>.from(decoded['rates']);

        setState(() {
          rateList = rates.keys.toList().map((key) {
            return Rate(
                code: key,
                value: rates['key'],
                date: decoded['date'],
                name: key);
          }).toList();
        });
      } else {
        var decoded = json.decode(response.body);
        throw Exception(decoded['message']);
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Ошибка'),
              content: Text('$e'),
              actions: <Widget>[
                FlatButton(
                  child: new Text('Ok'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          });
    }
  }

  @override
  void initState() {
    super.initState();

    // Call the getJSONData() method when the app initializes
    this.getJSONData();
  }
}
