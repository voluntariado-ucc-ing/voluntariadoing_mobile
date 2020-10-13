import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:voluntariadoing_mobile/donations/cubits/donations_cubit.dart';
import 'package:voluntariadoing_mobile/donations/models/donation.dart';
import 'package:voluntariadoing_mobile/donations/widgets/donation_card.dart';

class DonationsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _buildList();

  Widget _buildList() {
    return BlocBuilder<DonationsCubit, DonationsState>(
      builder: (_, state) {
        if (state is DonationsSuccess) {
          final donations = state.donations;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: donations.length,
            itemBuilder: (_, index) => _buildDonation(donations[index]),
          );
        }
        return Container();
      },
    );
  }

  Widget _buildDonation(Donation donation) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DonationCard(donation: donation),
    );
  }
}
