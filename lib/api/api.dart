import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:rates_app/consts.dart';


Future<http.Response> getCurrentRates() {
  return http.get(CBR_URL);
}