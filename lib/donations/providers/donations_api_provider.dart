import 'package:voluntariadoing_mobile/common/providers/api_provider.dart';
import 'package:voluntariadoing_mobile/donations/models/donation.dart';

class DonationsApiProvider extends ApiProvider {
  @override
  String get endpoint => 'donation';

  Future<List<Donation>> list() async {
    final response = await get('all/') as List;
    final donations = response.map<Donation>(
      (donation) {
        return Donation.fromMap(donation);
      },
    ).toList();
    return donations;
  }
}
