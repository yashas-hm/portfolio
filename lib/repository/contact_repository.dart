import 'dart:convert';
import 'dart:developer' show log;

import 'package:http/http.dart' as http show post;
import 'package:portfolio/model/contact.dart';

class ContactRepository {
  ContactRepository._();
  
  static Future<ContactResponse> sendEmailRequest(ContactRequest request) async {
    try {
      final response = await http.post(
        Uri.parse('https://yashashm.dev/api/mail'),
        body: jsonEncode(request.toJson()),
      );

      final responseBody = jsonDecode(response.body);

      return ContactResponse.fromJson(responseBody);
    } catch (err) {
      log(err.toString());
      return ContactResponse(
        success: false,
        message: 'An unexpected anomaly interrupted the transmission.',
      );
    }
  }
}
