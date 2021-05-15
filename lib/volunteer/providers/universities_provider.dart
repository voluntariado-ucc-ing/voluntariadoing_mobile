import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class UniversitiesProvider {
  Future<List<String>> getUniversities() async {
    final jsonString = await rootBundle.loadString(
      'assets/mock/universities.json',
    );
    final decoded = json.decode(jsonString) as List;
    final universities = decoded.map<String>((e) => e.toString()).toList();
    return universities;
  }
}
