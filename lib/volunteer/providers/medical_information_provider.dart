import 'dart:convert';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'package:voluntariadoing_mobile/volunteer/models/medical_info_item.dart';
import 'package:voluntariadoing_mobile/common/providers/api_provider.dart';

class MedicalInformationProvider extends ApiProvider {

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

  Future<String> _loadAMedicalInfoItem() async {
    return await rootBundle.loadString('assets/mock/medical_information.json');
  }

  Future loadMedicalInfoItem() async {
    String jsonString = await  _loadAMedicalInfoItem();
    final jsonResponse = json.decode(jsonString);
    await post('/volunteer/medical_info/:volunteer_id', body: {jsonResponse});
  }



  @override
  String get endpoint => 'MedicalInfoItem';
}
