import 'package:flutter/material.dart';
import 'say_control_back_quote_intent.dart';

class SayControlBackQuoteAction extends Action<SayControlBackQuoteIntent> {
  @override
  Object? invoke(SayControlBackQuoteIntent intent) {
    debugPrint("Saying 'Control-Back-Quote'");
    return null;
  }
}

