import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:voluntariadoing_mobile/common/widgets/navigation_drawer.dart';
import 'package:voluntariadoing_mobile/common/widgets/raised_text_input.dart';
import 'package:voluntariadoing_mobile/common/widgets/section_title.dart';
import 'package:voluntariadoing_mobile/common/widgets/select_button_group.dart';
import 'package:voluntariadoing_mobile/common/widgets/user_avatar.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/config/widget_utils.dart';
import 'package:voluntariadoing_mobile/donations/widgets/donations_list.dart';

class DonationsView extends StatefulWidget {
  @override
  _DonationsViewState createState() => _DonationsViewState();
}

class _DonationsViewState extends State<DonationsView> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) => Scaffold(
    key: _scaffoldKey,
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: _buildSearchBar(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: _buildStatus(),
            ),
            Expanded(
              child: Padding(
              padding: const EdgeInsets.only(top: 10),
                child: _buildList(),
              ),
            )
          ],
        ),
      )
    ),
    drawer: NavigationDrawer()
  );

  Widget _buildHeader() => Row(
    children: [
      Stack(
        children: [
          // TODO: replace this with an actual user image URL
          UserAvatar(
            url: 'https://us04images.zoom.us/p/a7_ffGB5RYeoNfdqALI3UA/557aa976-15d7-410f-822d-bfd28c5b498f-3113?type=large',
            onPress: () => _scaffoldKey.currentState?.openDrawer(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: _buildDrawerIcon()
          )
        ],
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SectionTitle(
            title: 'DONATIONS.DONATIONS_TITLE'.tr(),
          ),
        )
      ),
      _buildActions()
    ]
  );

  Widget _buildDrawerIcon() => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      boxShadow: WidgetUtils.boxShadowLighter
    ),
    height: 20,
    width: 20,
    child: Center(
      child: Icon(
        Icons.menu, 
        color: ColorPalette.darkGrey, 
        size: 12
      )
    ),
  );
  
  Widget _buildActions() => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Flexible(
        child: InkWell(
          onTap: (){},
          borderRadius: WidgetUtils.borderRadius10,
          splashColor: ColorPalette.lightGrey,
          child: Icon(
            Icons.filter_list, 
            color: ColorPalette.darkerGrey,
            size: 28,
          ),
        )
      )
    ]
  );

  Widget _buildSearchBar() => RaisedTextInput(
    hintText: 'COMMON.SEARCH_HINT'.tr(),
    icon: Icons.search,
  );

  Widget _buildStatus() => SelectButtonGroup(
    initialIndex: 0,
    labels: [
      'Por confirmar',
      'Por retirar',
      'Retirada',
      'Rechazada'
    ],
  );

  Widget _buildList() => DonationsList();
}