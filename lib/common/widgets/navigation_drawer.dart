import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:voluntariadoing_mobile/common/widgets/presentation_logo.dart';
import 'package:voluntariadoing_mobile/common/widgets/user_avatar.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';

class NavigationDrawer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => Drawer(
    child: Container(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                child: _buildHeader(context),
              ),
              // TODO: Implement Meetings section
              // NavigationDrawerItem(
              //   icon: Icons.people_outline, 
              //   title: 'COMMON.MEETINGS'.tr()
              // ),
              NavigationDrawerItem(
                icon: Icons.favorite_border, 
                title: 'COMMON.DONATIONS'.tr(),
                selected: true
              ),
              NavigationDrawerItem(
                icon: Icons.settings, 
                title: 'COMMON.SETTINGS'.tr(),
              ),
              Spacer(),
              PresentationLogo(
                showImage: false,
                mini: true
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Widget _buildHeader(BuildContext ctx) => Row(
    children: [
      // TODO: replace this with an actual user image URL
      UserAvatar(url: 'https://us04images.zoom.us/p/a7_ffGB5RYeoNfdqALI3UA/557aa976-15d7-410f-822d-bfd28c5b498f-3113?type=large'),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // TODO: replace this with an actual user name
                'Francisco Pitriqueo', 
                style: Theme.of(ctx).textTheme.headline6
                  .copyWith(
                    fontFamily: 'Nunito_900',
                    color: ColorPalette.darkGrey
                  )
              ),
              Text(
                'COMMON.EDIT_PROFILE'.tr(), 
                style: Theme.of(ctx).textTheme.subtitle1
                  .copyWith(
                    fontFamily: 'Nunito_900',
                    color: ColorPalette.grey
                  )
              ),
            ],
          )
        )
      ),
    ]
  );
}

class NavigationDrawerItem extends StatelessWidget {
  
  final IconData icon;
  final String title;
  final bool selected;
  final VoidCallback onPress;

  NavigationDrawerItem({
    @required this.title,
    this.icon,
    this.onPress,
    this.selected = false
  });
  
  @override
  Widget build(BuildContext context) {
    final color = selected 
      ? ColorPalette.primaryBlue
      : ColorPalette.grey;
    
    return Material(
      color: selected 
        ? ColorPalette.primaryBlue.withOpacity(.1) 
        : Colors.transparent,
      child: InkWell(
        onTap: () => _onPress(context),
        splashColor: ColorPalette.primaryBlue,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Icon(icon, color: color, size: 25),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    title, 
                    style: Theme.of(context).textTheme.headline6
                      .copyWith(
                        //fontFamily: 'Nunito_900',
                        color: color
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  void _onPress(BuildContext ctx) {
    Navigator.of(ctx).pop();
    if (onPress != null) {
      onPress();
    }
  }
}