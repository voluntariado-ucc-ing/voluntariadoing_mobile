import 'dart:convert';

import 'package:voluntariadoing_mobile/common/providers/api_provider.dart';
import 'package:voluntariadoing_mobile/volunteer/models/volunteer.dart';



class VolunteerApiProvider extends ApiProvider {
  @override
  String get endpoint => 'volunteer';

  Future<void> updatePassword(
      String username,
      String currentPassword,
      String newPassword,
      ) async {
    await put('auth/update/', body: {
      'username': username,
      'password': currentPassword,
      'new_password': newPassword
    });
  }

  Future<void> completeProfile(Volunteer volunteer) async {
    final payload = volunteer.toMap();
    payload.remove('volunteer_id');
    await patch('update/${volunteer.id}/', body: json.encode(payload));
  }

  Future<Volunteer> getById(int id) async {
    final response = await get('get/$id/');
    return Volunteer.fromMap(response);
  }

}