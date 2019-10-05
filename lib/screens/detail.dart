import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rates_app/models/provider.dart';

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
      appBar: AppBar(),
      body: Center(
        child: Text(rate.name)
      ),
    );
  }
  
}