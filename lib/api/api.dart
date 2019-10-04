import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:rates_app/consts.dart';


Future<http.Response> getRates({DateTime date, String base = 'RUB'}) {
  var formatter = DateFormat('yyyy-MM-dd');
  return http.get('$BASE_URL/${formatter.format(date)}?base=$base');
}