import 'dart:async';
import 'package:ecommerce_userapp/api_links.dart';
import 'package:http/http.dart' as http;

Future<bool> checkInternetConnection() async {
  try {
    final response = await http
        .get(Uri.parse('https://www.google.com'))
        .timeout(Duration(seconds: 5));
    return response.statusCode == 200;
  } on TimeoutException catch (_) {
    return false;
  } on Exception catch (_) {
    return false;
  }
}

Future<bool> testConnection() async {
  try {
    final response = await http
        .get(Uri.parse(ApiLinks.baseUrlconnect))
        .timeout(Duration(seconds: 5));
    if (response.statusCode == 200) {
      print('Server is working: ${response.body}');
      return true;
    } else {
      print('Server error: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Error: $e');
    return false;
  }
}
