import 'dart:convert';

import 'package:code_bangladesh_mobile_app/dto/app_data.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

class AppUtils {
  static String toBanglaNumber(String number) {
    final String banglaDigits = "০১২৩৪৫৬৭৮৯";
    return number.split('').map((ch) => banglaDigits[int.parse(ch)]).join();
  }
}
