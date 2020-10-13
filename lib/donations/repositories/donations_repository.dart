import 'package:voluntariadoing_mobile/donations/models/donation.dart';
import 'package:voluntariadoing_mobile/donations/providers/donations_api_provider.dart';

class DonationsRepository {
  DonationsApiProvider _provider;

  DonationsRepository({
    DonationsApiProvider provider,
  }) : _provider = provider ?? DonationsApiProvider();

  Future<List<Donation>> list() async {
    final donations = await _provider.list();
    return donations;
  }
}
