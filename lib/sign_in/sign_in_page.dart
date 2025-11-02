import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/common/enums.dart';
import 'package:flutter_template/common/theme.dart';
import 'package:flutter_template/di/injection.dart';
import 'package:flutter_template/sign_in/sign_in_cubit.dart';
import 'package:flutter_template/widget/shimmer.dart';
import 'package:go_router/go_router.dart';

import '../common/bloc_state.dart';
import '../home/home_page.dart';
import '../l10n/app_localizations.dart';
import '../widget/apple_sign_in_button.dart';
import '../widget/google_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  static const String name = 'sign_in';
  static const String path = '/sign_in';

  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: BlocProvider<SignInCubit>(
      create: (_) => getIt<SignInCubit>()..isSignedIn(),
      child: BlocConsumer<SignInCubit, SignInState>(
        builder:
            (context, state) => Shimmer(
              linearGradient: shimmerGradient,
              child: ShimmerLoading(
                isLoading: state.status == SignInStatus.loading,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      spacing: 16,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GoogleSignInButton(
                          title: AppLocalizations.of(context)!.signInWithGoogle,
                          isDark: false,
                          onTap:
                              () =>
                                  state.status == SignInStatus.loading
                                      ? null
                                      : context
                                          .read<SignInCubit>()
                                          .signInWithGoogle(),
                        ),
                        AppleSignInButton(
                          title: AppLocalizations.of(context)!.signInWithApple,
                          onTap:
                              () =>
                                  state.status == SignInStatus.loading
                                      ? null
                                      : context
                                          .read<SignInCubit>()
                                          .signInWithApple(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        listener: (context, state) {
          if (state.status == SignInStatus.signInFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context)!.signInError),
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 3),
              ),
            );
          } else if (state.status == SignInStatus.signInSuccessful) {
            context.goNamed(HomePage.name);
          }
        },
      ),
    ),
  );
}
