import 'package:voluntariadoing_mobile/donations/models/donation.dart';
import 'package:voluntariadoing_mobile/donations/providers/donations_api_provider.dart';
import 'package:voluntariadoing_mobile/volunteer/models/volunteer.dart';
import 'package:voluntariadoing_mobile/volunteer/providers/volunteer_api_provider.dart';

class DonationsRepository {
  DonationsApiProvider _provider;

  DonationsRepository({
    DonationsApiProvider provider,
  }) : _provider = provider ?? DonationsApiProvider();


 //Se hace una lista ordenada segun la donacion mas reciente
  Future<List<Donation>> list() async {
    final donations = await _provider.list();

   donations.sort((a,b) => b.date.compareTo(a.date));

    return donations;
  }


  Future<void> updateState(Donation donation) async {
    await _provider.updateState(donation);
  }


}
