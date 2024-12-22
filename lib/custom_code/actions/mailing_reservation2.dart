// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'package:http/http.dart' as http;
import 'dart:convert';

Future mailingReservation2(
  String? email,
) async {
  email = email ?? '';

  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  const service_id = "service_tfdk6kl";
  const template_id = "template_aq28rws";
  const user_id = "lGPTya7isqLEleKQ_";
  final response = await http.post(url,
      headers: {'content-type': 'application/json'},
      body: json.encode({
        "service_id": service_id,
        "template_id": template_id,
        "user_id": user_id,
        "template_params": {
          "sujet": 'Confirmation de Reservation ',
          "sent_to": email,
          "to_name": "jjjj",
          "message": "Vous avez bien reservé votre place ",
        }
      }));
  return response.statusCode;
}
