import 'package:get/get.dart';

validataInput(String value, int max, int min, String type) {
  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return 'Email not valid';
    }
  }
  if (type == "userName") {
    if (!GetUtils.isUsername(value)) {
      return 'UserName not valid';
    }
  }
  if (type == "Phone") {
    if (!GetUtils.isPhoneNumber(value)) {
      return 'Phone not valid';
    }
  }
  if (value.isEmpty) {
    return 'Value can\'t be empty';
  }

  if (value.length > max) {
    return 'Value can\'t be more than $max';
  }
  if (value.length < min) {
    return 'Value can\'t be less than $min';
  }
}
