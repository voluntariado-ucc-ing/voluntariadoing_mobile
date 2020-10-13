import 'package:voluntariadoing_mobile/volunteer/models/volunteer.dart';
import 'package:voluntariadoing_mobile/volunteer/providers/volunteer_api_provider.dart';

class VolunteerRepository {
  VolunteerApiProvider _provider;

  VolunteerRepository({
    VolunteerApiProvider provider,
  }) : _provider = provider ?? VolunteerApiProvider();

  Future<void> updatePassword(
    String username,
    String currentPassword,
    String newPassword,
  ) async {
    await _provider.updatePassword(username, currentPassword, newPassword);
  }

  Future<void> completeProfile(Volunteer volunteer) async {
    await _provider.completeProfile(volunteer);
  }

  Future<Volunteer> getById(int id) async {
    final volunteer = await _provider.getById(id);
    return volunteer;
  }
}
