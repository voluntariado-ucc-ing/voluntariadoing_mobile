import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voluntariadoing_mobile/common/widgets/no_overscroll_behavior.dart';
import 'package:voluntariadoing_mobile/common/widgets/section_title.dart';
import 'package:voluntariadoing_mobile/common/widgets/select_button_group.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/config/svg_assets.dart';
import 'package:voluntariadoing_mobile/config/widget_utils.dart';

class DonationDetailView extends StatefulWidget {
  @override
  _DonationDetailViewState createState() => _DonationDetailViewState();
}

class _DonationDetailViewState extends State<DonationDetailView> {
  
  @override
  Widget build(BuildContext context) => Scaffold(
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
                      child: _buildContactInfo()
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: _buildMap(),
                    ),
                  ],
                )
              )
            )
          ],
        ),
      )
    )
  );

  Widget _buildHeader() => Row(
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

  Widget _buildGeneralInfo() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      AutoSizeText(
        'Arroz',
        maxLines: 2,
        style: Theme.of(context).textTheme.headline4
          .copyWith(color: ColorPalette.primaryBlue)
      ),
      Text(
        '7kg',
        style: Theme.of(context).textTheme.headline5
          .copyWith(color: ColorPalette.darkGrey)
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SvgPicture.asset(
          SvgAssets.donationToBeConfirmed,
          width: WidgetUtils.getWidthPercentage(context, 30),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          'Por confirmar',
          style: Theme.of(context).textTheme.headline6
            .copyWith(color: ColorPalette.toBeConfirmed)
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: _buildStatus()
      ),
    ],
  );

  Widget _buildStatus() => SelectButtonGroup(
    initialIndex: 0,
    labels: [
      'Por confirmar',
      'Por retirar',
      'Retirada',
      'Rechazada'
    ],
    selectedColor: ColorPalette.toBeConfirmed,
    unselectedLabelColor: ColorPalette.toBeConfirmed,
    selectedLabelColor: Colors.white
  );

  Widget _buildContactInfo() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      _buildContactName(),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: _buildContactPhone(),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: _buildContactEmail(),
      )
    ],
  );

  Widget _buildContactName() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      borderRadius: WidgetUtils.borderRadius20,
      color: ColorPalette.primaryBlue
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.person, color: Colors.white, size: 18),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            'Lautaro Matías Bringas',
            style: Theme.of(context).textTheme.subtitle2
              .copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700
              )
          ),
        )
      ],
    ),
  );

  Widget _buildContactPhone() => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.phone, color: ColorPalette.darkGrey, size: 18),
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(
          '+543516984854',
          style: Theme.of(context).textTheme.subtitle2
            .copyWith(
              color: ColorPalette.darkGrey,
              fontWeight: FontWeight.w700
            )
        ),
      )
    ],
  );

  Widget _buildContactEmail() => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.mail, color: ColorPalette.darkGrey, size: 18),
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(
          'lautarobringas@gmail.com',
          style: Theme.of(context).textTheme.subtitle2
            .copyWith(
              color: ColorPalette.darkGrey,
              fontWeight: FontWeight.w700
            )
        ),
      )
    ],
  );

  Widget _buildMap() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: WidgetUtils.getWidthPercentage(context, 80),
        height: 160,
        decoration: BoxDecoration(
          color: ColorPalette.lightGrey,
          borderRadius: WidgetUtils.borderRadius20
        ),
        child: Center(child: Text('mapa xd')),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: _buildLocation(),
      )
    ],
  );

  Widget _buildLocation() => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.location_on, color: ColorPalette.darkGrey, size: 18),
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(
          'Córdoba, Maestro Vidal 1461',
          style: Theme.of(context).textTheme.subtitle2
            .copyWith(
              color: ColorPalette.darkGrey,
              fontWeight: FontWeight.w700
            )
        ),
      )
    ],
  );
}