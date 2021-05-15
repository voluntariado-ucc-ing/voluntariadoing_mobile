import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voluntariadoing_mobile/authentication/cubits/authentication_cubit.dart';
import 'package:voluntariadoing_mobile/common/widgets/navigation_drawer.dart';
import 'package:voluntariadoing_mobile/common/widgets/raised_text_input.dart';
import 'package:voluntariadoing_mobile/common/widgets/section_title.dart';
import 'package:voluntariadoing_mobile/common/widgets/select_button_group.dart';
import 'package:voluntariadoing_mobile/common/widgets/user_avatar.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/config/widget_utils.dart';
import 'package:voluntariadoing_mobile/donations/cubits/donations_cubit.dart';
import 'package:voluntariadoing_mobile/donations/models/donation.dart';
import 'package:voluntariadoing_mobile/donations/widgets/donations_list.dart';
import 'package:voluntariadoing_mobile/volunteer/cubits/volunteer_cubit.dart';

class DonationsView extends StatefulWidget {
  @override
  _DonationsViewState createState() => _DonationsViewState();
}

class _DonationsViewState extends State<DonationsView> {
  AuthenticationCubit authCubit;
  VolunteerCubit volunteerCubit;
  DonationsCubit donationsCubit;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    authCubit = BlocProvider.of<AuthenticationCubit>(context);
    volunteerCubit = VolunteerCubit();
    donationsCubit = DonationsCubit();
    getAuthenticatedVolunteer();
    getDonations();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    volunteerCubit?.close();
    donationsCubit?.close();
  }

  void getAuthenticatedVolunteer() {
    final id = (authCubit.state as AuthenticationSuccess)
        .authenticationUser
        .volunteerId;
    volunteerCubit.getVolunteer(id);
  }

  void getDonations() => donationsCubit.getDonations();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: volunteerCubit),
        BlocProvider.value(value: donationsCubit),
      ],
      child: Scaffold(
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
          ),
        ),
        drawer: NavigationDrawer(),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        _buildAvatar(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SectionTitle(
              title: 'DONATIONS.DONATIONS_TITLE'.tr(),
            ),
          ),
        ),
        _buildActions()
      ],
    );
  }

  Widget _buildAvatar() {
    final radius = 30.0;
    return BlocBuilder<VolunteerCubit, VolunteerState>(
      builder: (_, state) {
        return Stack(
          children: [
            if (state is VolunteerSuccess)
              UserAvatar(
                url: state.volunteer.details.photoUrl,
                onPress: () => _scaffoldKey.currentState?.openDrawer(),
                radius: radius,
              )
            else
              DefaultUserAvatar(radius: radius),
            Positioned(bottom: 0, right: 0, child: _buildDrawerIcon())
          ],
        );
      },
    );
  }

  Widget _buildDrawerIcon() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: WidgetUtils.boxShadowLighter,
      ),
      height: 20,
      width: 20,
      child: Center(
        child: Icon(
          Icons.menu,
          color: ColorPalette.darkGrey,
          size: 12,
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: InkWell(
            onTap: () {},
            borderRadius: WidgetUtils.borderRadius10,
            splashColor: ColorPalette.lightGrey,
            child: Icon(
              Icons.filter_list,
              color: ColorPalette.darkerGrey,
              size: 28,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSearchBar() {
    return RaisedTextInput(
      hintText: 'COMMON.SEARCH_HINT'.tr(),
      icon: Icons.search,
    );
  }

  Widget _buildStatus() {
    final statusKeyList =
        DonationStatus.values.map(donationStatusToKey).toList();
    final statusLabels = statusKeyList
        .map((key) => 'DONATIONS.${key.toUpperCase()}'.tr())
        .toList();
    return SelectButtonGroup(
      initialIndex: 0,
      labels: statusLabels,
    );
  }

  Widget _buildList() => DonationsList();
}
