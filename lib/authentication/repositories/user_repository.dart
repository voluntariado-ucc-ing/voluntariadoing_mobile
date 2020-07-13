import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:voluntariadoing_mobile/authentication/models/medical_info_item.dart';
import 'package:voluntariadoing_mobile/common/repositories/repository.dart';

class UserRepository extends Repository {

  @override
  String get endpoint => 'user';

  Future<List<MedicalInfoItem>> getMedicalInformation() async {
    final jsonString = await rootBundle.loadString(
      'assets/mock/medical_information.json');
    final decoded = json.decode(jsonString);
    final items = decoded['items'];
    if (items != null) {
      final medicalInfoItems = (items as List).map(
        (e) => MedicalInfoItem.fromJson(e)).toList();
      return medicalInfoItems;
    }
    return null;
  }

}