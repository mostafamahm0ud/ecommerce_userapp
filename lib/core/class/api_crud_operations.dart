import 'dart:convert';

import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/function/check_internet_conection.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ApiCrudOperationsModel {
  Future<Either<ApiStatusRequest, Map>> postData(
      String linkURL, Map data) async {
    try {
      if (await testConnection()) {
        var response = await http.post(Uri.parse(linkURL), body: data);
        print('Response Status Code: ${response.statusCode}');
        // print('Response Body: ${response.body}');
        if (response.statusCode == 200 || response.statusCode == 201) {
          try {
            Map responseDate = jsonDecode(response.body);
            return Right(responseDate);
          } catch (e) {
            print('JSON Parsing Error: $e');
            return const Left(ApiStatusRequest.serverFailure);
          }
        } else {
          return const Left(ApiStatusRequest.serverFailure);
        }
      } else {
        return const Left(ApiStatusRequest.offLinefailure);
      }
    } catch (e) {
      print('Error in postData: $e');
      return const Left(ApiStatusRequest.serverFailure);
    }
  }
}
