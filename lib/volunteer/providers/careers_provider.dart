import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class CareersProvider {
  Future<List<String>> getCareers() async {
    final jsonString = await rootBundle.loadString(
      'assets/mock/careers.json',
    );
    final decoded = json.decode(jsonString) as List;
    final careers = decoded.map<String>((e) => e.toString()).toList();
    return careers;
  }
}
