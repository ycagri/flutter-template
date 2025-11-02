import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/common/theme.dart';
import 'package:flutter_template/di/injection.dart';
import 'package:flutter_template/home/home_page.dart';
import 'package:flutter_template/leaderboard/leaderboard_page.dart';
import 'package:flutter_template/profile/profile_cubit.dart';
import 'package:flutter_template/sign_in/sign_in_page.dart';
import 'package:flutter_template/widget/shimmer.dart';
import 'package:go_router/go_router.dart';

import '../common/bloc_state.dart';
import '../l10n/app_localizations.dart';
import '../widget/bottom_navigation_page.dart';

class ProfilePage extends BottomNavigationPage {
  static const index = 2;
  static const String name = 'profile';
  static const String path = '/profile';

  const ProfilePage({super.key}) : super(currentIndex: index);

  @override
  Widget buildBody(BuildContext context) => BlocProvider<ProfileCubit>(
    create: (context) => getIt<ProfileCubit>()..isSignedIn(),
    child: BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (!state.isLoading && state.profile == null) {
          context.goNamed(SignInPage.name);
        }
      },
      builder:
          (context, state) => Shimmer(
            linearGradient: shimmerGradient,
            child: ShimmerLoading(
              isLoading: state.isLoading,
              child: Center(
                child: Center(
                  child: Text(AppLocalizations.of(context)!.profile),
                ),
              ),
            ),
          ),
    ),
  );

  @override
  String? title(BuildContext context) => AppLocalizations.of(context)!.profile;

  @override
  void onTabSelected(BuildContext context, int selectedTab) {
    if (selectedTab == HomePage.index) {
      context.goNamed(HomePage.name);
    } else if (selectedTab == LeaderboardPage.index) {
      context.goNamed(LeaderboardPage.name);
    }
  }
}
