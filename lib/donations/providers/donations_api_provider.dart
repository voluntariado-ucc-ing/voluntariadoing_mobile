import 'dart:convert';
import 'package:voluntariadoing_mobile/authentication/models/api_credentials.dart';
import 'package:voluntariadoing_mobile/common/providers/api_provider.dart';
import 'package:voluntariadoing_mobile/donations/models/donation.dart';



class DonationsApiProvider extends ApiProvider {
  @override
  String get endpoint => 'donation';

  get apiAuthCredentials => this.apiAuthCredentials;

  Future<List<Donation>> list() async {
    final response = await get('all/') as List;
    final donations = response.map<Donation>(
      (donation) {
        return Donation.fromMap(donation);
      },
    ).toList();
    return donations;
  }

  /* UpdateState actualiza los estados de las donaciones, debemos pasarle por parametro
la donacion en donationcart.dart y pegarle al endpoint api/donation/donation.id
pasandole en el header la autorizacion del token y en el body un json con el nuevo estado*/
  Future<void> updateState(Donation donation) async {
    final payload2 = donation.toMap2();
    String response2 = "token";
    await patch('${donation.id}', body: json.encode(payload2), headers: {'content-type': 'application/json' , 'authorization': 'Bearer jkhkjn'} );

  }
}
