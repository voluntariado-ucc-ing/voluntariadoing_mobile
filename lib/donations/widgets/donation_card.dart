import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:voluntariadoing_mobile/common/widgets/slidable_card.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/config/svg_assets.dart';
import 'package:voluntariadoing_mobile/donations/cubits/donations_cubit.dart';
import 'package:voluntariadoing_mobile/donations/models/donation.dart';
import 'package:voluntariadoing_mobile/donations/providers/donations_api_provider.dart';
import 'package:voluntariadoing_mobile/donations/views/donation_detail_view.dart';
import 'package:voluntariadoing_mobile/donations//repositories/donations_repository.dart';
import 'package:voluntariadoing_mobile/volunteer/models/volunteer.dart';


// ignore: must_be_immutable
class DonationCard extends StatelessWidget {
  final Donation donation;

  DonationsApiProvider _repository;

  DonationCard({DonationsRepository repository, @required this.donation})
      : _repository = repository ?? DonationsApiProvider();

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    if (donation.status== DonationStatus.toBeConfirmed) {
      return SlidableCard(
        content: _buildContent(context),
        onPress: () =>
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DonationDetailView(donation: donation),
              ),
            ),
        rightGradient: LinearGradient(
          colors: [ColorPalette.secondaryBlue, ColorPalette.primaryBlue],
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
        ),
        rightAction: () {
          //Pone en to_be_retrieved al estado de la donacion
          keyToDonationStatus('to_be_retrieved');
          donation.status = DonationStatus.toBeRetrieved;
          _repository.updateState(donation) ;

        },
        rightIcon: _buildRightIcon(context),

        leftGradient: LinearGradient(
          colors: [ColorPalette.rejected, ColorPalette.red],
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
        ),
        leftAction: () {
          //Pone en rejected al estado de la donacion
          keyToDonationStatus('rejected');
          donation.status = DonationStatus.rejected;
          _repository.updateState(donation) ;

        },
        leftIcon: _buildLeftIcon(context),
      );
    }
    else if (donation.status == DonationStatus.toBeRetrieved) {
      return SlidableCard(
        content: _buildContent(context),
        onPress: () =>
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DonationDetailView(donation: donation),
              ),
            ),
        rightGradient: LinearGradient(
          colors: [ColorPalette.aqua, ColorPalette.aqua],
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
        ),
        rightAction: () {
          //Pone en retrieved al estado de la donacion
          keyToDonationStatus('retrieved');
          donation.status = DonationStatus.retrieved;
          _repository.updateState(donation) ;
        },
        rightIcon: _buildRightIcon(context),

        leftGradient: LinearGradient(
          colors: [ColorPalette.rejected, ColorPalette.red],
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
        ),
        leftAction: () {
          //Pone en rejected al estado de la donacion
          keyToDonationStatus('rejected');
          donation.status = DonationStatus.rejected;
          _repository.updateState(donation) ;
        },
        leftIcon: _buildLeftIcon(context),
      );
    }
    else if (donation.status == DonationStatus.retrieved) {
      return SlidableCard(
        content: _buildContent(context),
        onPress: () =>
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DonationDetailView(donation: donation),
              ),
            ),
        rightGradient: LinearGradient(
          colors: [ColorPalette.grey, ColorPalette.grey],
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
        ),
        rightAction: () {
        },
        rightIcon: _buildRightIcon(context),

        leftGradient: LinearGradient(
          colors: [ColorPalette.grey, ColorPalette.grey],
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
        ),
        leftAction: () {
        },
        leftIcon: _buildLeftIcon(context),
      );
    }

    else if (donation.status == DonationStatus.rejected) {
      return SlidableCard(
        content: _buildContent(context),
        onPress: () =>
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DonationDetailView(donation: donation),
              ),
            ),
        rightGradient: LinearGradient(
          colors: [ColorPalette.secondaryBlue, ColorPalette.primaryBlue],
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
        ),
        rightAction: () {
          //Pone en to_be_confirmed al estado de la donacion
          keyToDonationStatus('to_be_confirmed');
          donation.status = DonationStatus.toBeRetrieved;
        },
        rightIcon: _buildRightIcon(context),

        leftGradient: LinearGradient(
          colors: [ColorPalette.grey, ColorPalette.grey],
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
        ),
        leftAction: () {
        },
        leftIcon: _buildLeftIcon(context),
      );
    }

  }


  Widget _buildRightIcon(BuildContext ctx) {
    if (donation.status == DonationStatus.toBeConfirmed || donation.status == DonationStatus.rejected) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 80,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.alarm, color: Colors.white, size: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'Marcar para retirar',
                    textAlign: TextAlign.center,
                    style: Theme
                        .of(ctx)
                        .textTheme
                        .button
                        .copyWith(
                        fontFamily: 'Nunito_900', color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }
    else if (donation.status == DonationStatus.toBeRetrieved){
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 80,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check, color: Colors.white, size: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'Retirada',
                    textAlign: TextAlign.center,
                    style: Theme
                        .of(ctx)
                        .textTheme
                        .button
                        .copyWith(
                        fontFamily: 'Nunito_900', color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }
  }

  Widget _buildLeftIcon(BuildContext ctx) {
      if (donation.status == DonationStatus.toBeRetrieved || donation.status == DonationStatus.toBeConfirmed){
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 80,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.close, color: Colors.white, size: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child:
                  Text(
                    'Rechazar',
                    textAlign: TextAlign.center,
                    style: Theme
                        .of(ctx)
                        .textTheme
                        .button
                        .copyWith(
                        fontFamily: 'Nunito_900', color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),

      );
    }
    // ignore: unrelated_type_equality_checks
      if (donation.status == DonationStatus.rejected) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 80,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child:
                  Text(
                    ' ',
                    textAlign: TextAlign.center,
                    style: Theme
                        .of(ctx)
                        .textTheme
                        .button
                        .copyWith(
                        fontFamily: 'Nunito_900', color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),

      );
    }


  }

  Widget _buildContent(BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          _buildStatus(ctx),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(ctx),
                  _buildQuantity(ctx),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: _buildLocation(ctx),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row _buildLocation(BuildContext ctx) {
    final direction = donation.direction;
    final location =
        '${direction.city}, ${direction.street} ${direction.number}';
    return Row(
      children: [
        Icon(Icons.location_on, size: 16, color: ColorPalette.primaryBlue),
        AutoSizeText(
          location,
          maxLines: 1,
          style: Theme.of(ctx).textTheme.caption.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorPalette.darkGrey,
              ),
        )
      ],
    );
  }

  Row _buildQuantity(BuildContext ctx) {
    final quantityText = '${donation.quantity} ${donation.unit}';
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            '${"COMMON.QUANTITY".tr()}: ',
            style: Theme.of(ctx).textTheme.bodyText2.copyWith(
                color: ColorPalette.grey, fontWeight: FontWeight.w600),
          ),
        ),
        Flexible(
          child: Text(
            quantityText,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(ctx).textTheme.bodyText2.copyWith(
                fontFamily: 'Nunito_900', color: ColorPalette.darkGrey),
          ),
        ),
      ],
    );
  }

  AutoSizeText _buildTitle(BuildContext ctx) {
    return AutoSizeText(
      donation.element,
      maxLines: 2,
      style: Theme.of(ctx)
          .textTheme
          .headline6
          .copyWith(fontFamily: 'Nunito_900', color: ColorPalette.darkGrey),
    );
  }

  Column _buildStatus(BuildContext ctx) {
    final asset = _svgAssetFromDonationStatus(donation.status);
    final title =
        'DONATIONS.${donationStatusToKey(donation.status).toUpperCase()}'.tr();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          asset,
          width: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            title,
            style: Theme.of(ctx).textTheme.caption.copyWith(
                  fontFamily: 'Nunito_900',
                  color: ColorPalette.toBeConfirmed,
                ),
          ),
        )
      ],
    );
  }

  String _svgAssetFromDonationStatus(DonationStatus donationStatus) {
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
}
