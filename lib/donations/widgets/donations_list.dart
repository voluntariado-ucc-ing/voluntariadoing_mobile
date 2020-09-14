import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/donations/widgets/donation_card.dart';

class DonationsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListView.builder(
    padding: const EdgeInsets.symmetric(vertical: 10),
    itemCount: 3,
    itemBuilder: _buildDonation,
  );

  Widget _buildDonation(BuildContext ctx, int index) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: DonationCard(),
  );
}