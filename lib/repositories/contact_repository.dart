import 'dart:convert';

import 'package:http/http.dart' as http show post;
import 'package:portfolio/model/contact.dart';

class ContactRepository {
  ContactRepository._();

  static Future<ContactResponse> sendEmailRequest(
      ContactRequest request) async {
    try {
      final response = await http.post(
        Uri.parse('https://staging.yashashm.dev/api/mail'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      final responseBody = jsonDecode(response.body);

      return ContactResponse.fromJson(responseBody);
    } catch (err) {
      return ContactResponse(
        success: false,
        message: 'An unexpected anomaly interrupted the transmission.',
      );
    }
  }
}
