import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voluntariadoing_mobile/common/widgets/presentation_logo.dart';
import 'package:voluntariadoing_mobile/common/widgets/user_avatar.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/volunteer/cubits/volunteer_cubit.dart';

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
                      selected: true),
                  NavigationDrawerItem(
                    icon: Icons.settings,
                    title: 'COMMON.SETTINGS'.tr(),
                  ),
                  Spacer(),
                  PresentationLogo(showImage: false, mini: true),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildHeader(BuildContext ctx) {
    return BlocBuilder<VolunteerCubit, VolunteerState>(
      builder: (_, state) {
        return Row(
          children: [
            _buildAvatar(state),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildName(ctx, state),
                    Text(
                      'COMMON.EDIT_PROFILE'.tr(),
                      style: Theme.of(ctx).textTheme.subtitle1.copyWith(
                          fontFamily: 'Nunito_900', color: ColorPalette.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAvatar(VolunteerState state) {
    final radius = 30.0;
    if (state is VolunteerSuccess) {
      return UserAvatar(
        url: state.volunteer.details.photoUrl,
        radius: radius,
      );
    }
    return DefaultUserAvatar(radius: radius);
  }

  Widget _buildName(BuildContext ctx, VolunteerState state) {
    if (state is VolunteerSuccess) {
      final name = '${state.volunteer.firstName} ${state.volunteer.lastName}';
      return Text(
        name,
        style: Theme.of(ctx)
            .textTheme
            .headline6
            .copyWith(fontFamily: 'Nunito_900', color: ColorPalette.darkGrey),
      );
    }
    return Container();
  }
}

class NavigationDrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final VoidCallback onPress;

  NavigationDrawerItem(
      {@required this.title, this.icon, this.onPress, this.selected = false});

  @override
  Widget build(BuildContext context) {
    final color = selected ? ColorPalette.primaryBlue : ColorPalette.grey;

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
                    child: Text(title,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            //fontFamily: 'Nunito_900',
                            color: color)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _onPress(BuildContext ctx) {
    Navigator.of(ctx).pop();
    if (onPress != null) {
      onPress();
    }
  }
}
