import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'package:voluntariadoing_mobile/volunteer/models/medical_info_item.dart';

class MedicalInformationProvider {
  Future<List<MedicalInfoItem>> getMedicalInformation() async {
    final jsonString = await rootBundle.loadString(
      'assets/mock/medical_information.json',
    );
    final decoded = json.decode(jsonString);
    final items = decoded['items'] as List;
    if (items != null) {
      final medicalInfoItems =
          items.map((e) => MedicalInfoItem.fromMap(e)).toList();
      return medicalInfoItems;
    }
    return null;
  }
}
