import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../home/navigation_bar.dart';

class SignInController extends GetxController {
  var isLoading = false.obs;
  var email = ''.obs;
  var password = ''.obs;
  var isChecked = false.obs;

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> login() async {
    if (email.value.isNotEmpty && password.value.isNotEmpty && isChecked.value) {
      isLoading.value = true;  // Start loading
      final url = 'https://api.mr-corp.ca/api/login/';
      try {
        final response = await http.post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'email': email.value,
            'password': password.value,
            'device_id': 'dcndjc89',
          }),
        );

        if (response.statusCode == 200) {
          Get.snackbar("Success", "Login Successful");
          Get.to(() => const NavigationAppBar());
        } else {
          if (response.statusCode == 401) {
            Get.snackbar('Error', 'Invalid email or password.');
          } else if (response.statusCode == 500) {
            Get.snackbar('Error', 'Server error, please try again later.');
          } else {
            Get.snackbar('Error', 'Login failed: ${response.body}');
          }
        }
      } catch (e) {
        Get.snackbar('Error', 'Unable to connect to the server: $e');
      } finally {
        isLoading.value = false;  // Stop loading
      }
    } else {
      Get.snackbar('Checkbox Required', 'Please accept the terms and conditions.');
    }
  }
}
