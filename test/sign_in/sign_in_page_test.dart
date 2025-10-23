import 'dart:async';

import 'package:flutter_template/common/bloc_state.dart';
import 'package:flutter_template/common/enums.dart';
import 'package:flutter_template/di/injection.dart';
import 'package:flutter_template/sign_in/sign_in_cubit.dart';
import 'package:flutter_template/sign_in/sign_in_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../common/wrap_for_testing.dart';
import '../utils/mocks.mocks.dart';

void main() {
  final signInCubit = MockSignInCubit();

  group('SignInPageTest', () {
    setUp(() {
      getIt.registerFactory<SignInCubit>(() => signInCubit);
    });

    tearDown(() {
      getIt.reset();
      clearInteractions(signInCubit);
    });

    testWidgets('SignInWithGoogleTest', (WidgetTester tester) async {
      when(
        signInCubit.state,
      ).thenAnswer((_) => SignInState(status: SignInStatus.notSignedIn));
      await tester.pumpWidget(wrapForTesting(child: SignInPage()));
      await tester.pump();
      verify(signInCubit.isSignedIn()).called(1);
      await tester.tap(find.text("Sign in with Google"));
      verify(signInCubit.signInWithGoogle()).called(1);
      verifyNever(signInCubit.signInWithApple());
    });

    testWidgets('SignInWithAppleTest', (WidgetTester tester) async {
      when(
        signInCubit.state,
      ).thenAnswer((_) => SignInState(status: SignInStatus.notSignedIn));
      await tester.pumpWidget(wrapForTesting(child: SignInPage()));
      await tester.pump();
      verify(signInCubit.isSignedIn()).called(1);
      await tester.tap(find.text("Sign in with Apple"));
      verify(signInCubit.signInWithApple()).called(1);
      verifyNever(signInCubit.signInWithGoogle());
    });

    testWidgets('SignInErrorTest', (WidgetTester tester) async {
      when(
        signInCubit.state,
      ).thenAnswer((_) => SignInState(status: SignInStatus.notSignedIn));
      final cubitStream = StreamController<SignInState>.broadcast();
      when(signInCubit.stream).thenAnswer((_) => cubitStream.stream);
      when(signInCubit.signInWithApple()).thenAnswer((_) {
        cubitStream.add(SignInState(status: SignInStatus.signInFailure));
      });
      await tester.pumpWidget(wrapForTesting(child: SignInPage()));
      await tester.pump();
      verify(signInCubit.isSignedIn()).called(1);
      await tester.tap(find.text("Sign in with Apple"));
      verify(signInCubit.signInWithApple()).called(1);
      await tester.pump();
      expect(
        find.text(
          "We couldn’t sign you in right now. Please check your connection and try again.",
        ),
        findsOneWidget,
      );
    });
  });
}
