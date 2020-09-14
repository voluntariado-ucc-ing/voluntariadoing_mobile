import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:voluntariadoing_mobile/volunteer/models/medical_info_item.dart';
import 'package:voluntariadoing_mobile/authentication/models/api_credentials.dart';
import 'package:voluntariadoing_mobile/common/repositories/api_repository.dart';

class VolunteerRepository extends ApiRepository {
  @override
  String get endpoint => 'volunteer';

  VolunteerRepository(ApiCredentials credentials) : super(credentials);

  Future<List<MedicalInfoItem>> getMedicalInformation() async {
    final jsonString =
        await rootBundle.loadString('assets/mock/medical_information.json');
    final decoded = json.decode(jsonString);
    final items = decoded['items'];
    if (items != null) {
      final medicalInfoItems =
          (items as List).map((e) => MedicalInfoItem.fromJson(e)).toList();
      return medicalInfoItems;
    }
    return null;
  }
}
