import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/model/experience_model.dart';

class AppHelper {
  static void indexCheck(int index) {
    final ctr = Get.find<NavController>();
    if (ctr.currentIndex.value != index) {
      ctr.pageIndex = index;
      ctr.currentIndex.value = index;
    }
  }

  static String getTimeLine(ExperienceModel model) {
    final from = DateFormat('MMMM yyyy').format(model.from);
    final to = DateFormat('MMMM yyyy').format(model.to);
    final present = model.to.isAfter(DateTime.now());
    return '$from — ${present ? 'Present' : to}';
  }

  static Future<(bool, String)> sendMessage({
    required String email,
    required String text,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(const String.fromEnvironment('BASE_URL')),
        headers: <String, String>{
          'Authorization': 'Bearer ${const String.fromEnvironment('JWT')}',
        },
        body: jsonEncode({'email': email, 'message': text}),
      );

      final responseBody = jsonDecode(response.body);

      return (
        responseBody['success'] == 'true',
        responseBody['message'].toString(),
      );
    } catch (err) {
      log(err.toString());
      return (
        false,
        'Communication hiccup! Unexpected error encountered. Retry later, please!',
      );
    }
  }
}

extension RemapExtension on num {
  num remap(num minExtent, num maxExtent, num minRange, num maxRange) {
    return (this - minExtent) /
            (maxExtent - minExtent) *
            (maxRange - minRange) +
        minRange;
  }
}

extension GetByIdentifier<T> on List {
  T getByIdentifier(String identifier) {
    return firstWhere(
      (element) => element.identifier == identifier,
      orElse: () => throw Exception('Invalid Identifier'),
    );
  }
}
