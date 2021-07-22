import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voluntariadoing_mobile/common/widgets/no_overscroll_behavior.dart';
import 'package:voluntariadoing_mobile/common/widgets/section_title.dart';
import 'package:voluntariadoing_mobile/common/widgets/select_button_group.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/config/svg_assets.dart';
import 'package:voluntariadoing_mobile/config/widget_utils.dart';
import 'package:voluntariadoing_mobile/donations/models/donation.dart';
import 'package:voluntariadoing_mobile/volunteer/cubits/volunteer_cubit.dart';

class DonationDetailView extends StatefulWidget {
  final Donation donation;

  DonationDetailView({@required this.donation});

  @override
  _DonationDetailViewState createState() => _DonationDetailViewState();
}

class _DonationDetailViewState extends State<DonationDetailView> {
  VolunteerCubit volunteerCubit;

  @override
  void initState() {
    volunteerCubit = VolunteerCubit();
    getDonationVolunteer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    volunteerCubit?.close();
  }

  void getDonationVolunteer() {
    volunteerCubit.getVolunteer(widget.donation.donatorId);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: volunteerCubit),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: NoOverscrollBehavior(),
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      children: [
                        _buildGeneralInfo(),
                        Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: _buildContactInfo()),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: _buildMap(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.of(context).maybePop(),
          child: Icon(
            Icons.arrow_back,
            color: ColorPalette.darkerGrey,
            size: 28,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SectionTitle(
              title: 'DONATIONS.DONATION_DETAIL_TITLE'.tr(),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildGeneralInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTitle(),
        _buildQuantity(),
        _buildStatusImage(),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: _buildStatus()

        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: _buildStatusList(),
        ),
      ],
    );
  }

  Text _buildStatus() {
    final donation = widget.donation;
    final color = _colorFromDonationStatus(donation.status);
    final text =
        'DONATIONS.${donationStatusToKey(donation.status).toUpperCase()}'.tr();
    return Text(
      text,
      style: Theme.of(context).textTheme.headline6.copyWith(color: color),
    );
  }

  Text _buildQuantity() {
    final donation = widget.donation;
    final quantityText = '${donation.quantity} ${donation.unit}';
    return Text(
      quantityText,
      style: Theme.of(context)
          .textTheme
          .headline5
          .copyWith(color: ColorPalette.darkGrey),
    );
  }

  Padding _buildStatusImage() {
    final asset = _svgAssetFromDonationStatus(widget.donation.status);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SvgPicture.asset(
        asset,
        width: WidgetUtils.getWidthPercentage(context, 30),
      ),
    );
  }

  AutoSizeText _buildTitle() {
    return AutoSizeText(
      widget.donation.element,
      maxLines: 2,
      style: Theme.of(context)
          .textTheme
          .headline4
          .copyWith(color: ColorPalette.primaryBlue),
    );
  }

  Widget _buildStatusList() {
    final statusKeyList =
        DonationStatus.values.map(donationStatusToKey).toList();
    final statusLabels = statusKeyList
        .map((key) => 'DONATIONS.${key.toUpperCase()}'.tr())
        .toList();
    final color = _colorFromDonationStatus(widget.donation.status);
    return SelectButtonGroup(
      unselectable: false,
      initialIndex: 0,
      labels: statusLabels,
      selectedColor: color,
      unselectedLabelColor: color,
      selectedLabelColor: Colors.white,
    );
  }

  String _svgAssetFromDonationStatus(DonationStatus donationStatus) {
    Donation donation;

    switch (donationStatus) {
      case DonationStatus.toBeConfirmed:
        return SvgAssets.donationToBeConfirmed;
      case DonationStatus.toBeRetrieved:
        return SvgAssets.donationToBeRetrieved;
      case DonationStatus.retrieved:
        return SvgAssets.donationRetrieved;
      case DonationStatus.rejected:
        return SvgAssets.donationRejected;
    }
    return null;
  }

  Color _colorFromDonationStatus(DonationStatus donationStatus) {
    switch (donationStatus) {
      case DonationStatus.toBeConfirmed:
        return ColorPalette.toBeConfirmed;
      case DonationStatus.toBeRetrieved:
        return ColorPalette.toBeRetrieved;
      case DonationStatus.retrieved:
        return ColorPalette.retrieved;
      case DonationStatus.rejected:
        return ColorPalette.rejected;
    }
    return null;
  }

  Widget _buildContactInfo() {
    return BlocBuilder<VolunteerCubit, VolunteerState>(
      builder: (_, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildContactName(state),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: _buildContactPhone(state),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: _buildContactEmail(state),
            )
          ],
        );
      },
    );
  }

  Widget _buildContactName(VolunteerState state) {
    if (state is VolunteerSuccess) {
      final volunteer = state.volunteer;
      final name = '${volunteer.firstName} ${volunteer.lastName}';
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: WidgetUtils.borderRadius20,
          color: ColorPalette.primaryBlue,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.person, color: Colors.white, size: 18),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      );
    }
    return Container();
  }

  Widget _buildContactPhone(VolunteerState state) {
    if (state is VolunteerSuccess) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.phone, color: ColorPalette.darkGrey, size: 18),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              state.volunteer.details.phoneNumber,
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                  color: ColorPalette.darkGrey, fontWeight: FontWeight.w700),
            ),
          )
        ],
      );
    }
    return Container();
  }

  Widget _buildContactEmail(VolunteerState state) {
    if (state is VolunteerSuccess) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.mail, color: ColorPalette.darkGrey, size: 18),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              state.volunteer.details.contactEmail,
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                  color: ColorPalette.darkGrey, fontWeight: FontWeight.w700),
            ),
          )
        ],
      );
    }
    return Container();
  }

  Widget _buildMap() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: WidgetUtils.getWidthPercentage(context, 80),
          height: 160,
          decoration: BoxDecoration(
              color: ColorPalette.lightGrey,
              borderRadius: WidgetUtils.borderRadius20),
          child: Center(child: Text('map placeholder')),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: _buildLocation(),
        )
      ],
    );
  }


  Widget _buildLocation() {
    final direction = widget.donation.direction;
    final location =
        '${direction.city}, ${direction.street} ${direction.number}';
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.location_on, color: ColorPalette.darkGrey, size: 18),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            location,
            style: Theme.of(context).textTheme.subtitle2.copyWith(
                color: ColorPalette.darkGrey, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
