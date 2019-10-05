import 'package:flutter/material.dart';
import 'package:rates_app/models/rate.dart';

class RateProvider extends ChangeNotifier {
  Rate currentrate;

  void setCurrentRate(Rate rate) {
    this.currentrate = rate;
    notifyListeners();
  }
}