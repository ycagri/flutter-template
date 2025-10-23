import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_template/common/bloc_state.dart';
import 'package:flutter_template/common/enums.dart';
import 'package:flutter_template/sign_in/sign_in_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../utils/mocks.mocks.dart';

void main() {
  final signInRepository = MockSignInRepository();

  group('SignInCubitTest', () {
    tearDown(() {
      clearInteractions(signInRepository);
    });

    blocTest<SignInCubit, SignInState>(
      'AlreadySignedInTest',
      setUp: () {
        when(
          signInRepository.isSignedIn(),
        ).thenAnswer((_) => Future.value(true));
      },
      build: () => SignInCubit(signInRepository),
      act: (bloc) => bloc.isSignedIn(),
      expect: () => [SignInState(status: SignInStatus.signInSuccessful)],
      verify: (_) {
        verify(signInRepository.isSignedIn()).called(1);
        verifyNoMoreInteractions(signInRepository);
      },
    );

    blocTest<SignInCubit, SignInState>(
      'NotSignedInTest',
      setUp: () {
        when(
          signInRepository.isSignedIn(),
        ).thenAnswer((_) => Future.value(false));
      },
      build: () => SignInCubit(signInRepository),
      act: (bloc) => bloc.isSignedIn(),
      expect: () => [SignInState(status: SignInStatus.notSignedIn)],
      verify: (_) {
        verify(signInRepository.isSignedIn()).called(1);
        verifyNoMoreInteractions(signInRepository);
      },
    );

    blocTest<SignInCubit, SignInState>(
      'SignInWithGoogleTest',
      setUp: () {
        when(
          signInRepository.signInWithGoogle(),
        ).thenAnswer((_) => Future.value(true));
      },
      build: () => SignInCubit(signInRepository),
      act: (bloc) => bloc.signInWithGoogle(),
      expect:
          () => [
            SignInState(status: SignInStatus.loading),
            SignInState(status: SignInStatus.signInSuccessful),
          ],
      verify: (_) {
        verify(signInRepository.signInWithGoogle()).called(1);
        verifyNoMoreInteractions(signInRepository);
      },
    );

    blocTest<SignInCubit, SignInState>(
      'SignInWithGoogleFailureTest',
      setUp: () {
        when(
          signInRepository.signInWithGoogle(),
        ).thenAnswer((_) => Future.value(false));
      },
      build: () => SignInCubit(signInRepository),
      act: (bloc) => bloc.signInWithGoogle(),
      expect:
          () => [
            SignInState(status: SignInStatus.loading),
            SignInState(status: SignInStatus.signInFailure),
          ],
      verify: (_) {
        verify(signInRepository.signInWithGoogle()).called(1);
        verifyNoMoreInteractions(signInRepository);
      },
    );

    blocTest<SignInCubit, SignInState>(
      'SignInWithAppleTest',
      setUp: () {
        when(
          signInRepository.signInWithApple(any),
        ).thenAnswer((_) => Future.value(true));
      },
      build: () => SignInCubit(signInRepository),
      act: (bloc) => bloc.signInWithApple(),
      expect:
          () => [
            SignInState(status: SignInStatus.loading),
            SignInState(status: SignInStatus.signInSuccessful),
          ],
      verify: (_) {
        verify(signInRepository.signInWithApple(any)).called(1);
        verifyNoMoreInteractions(signInRepository);
      },
    );

    blocTest<SignInCubit, SignInState>(
      'SignInWithAppleFailureTest',
      setUp: () {
        when(
          signInRepository.signInWithApple(any),
        ).thenAnswer((_) => Future.value(false));
      },
      build: () => SignInCubit(signInRepository),
      act: (bloc) => bloc.signInWithApple(),
      expect:
          () => [
            SignInState(status: SignInStatus.loading),
            SignInState(status: SignInStatus.signInFailure),
          ],
      verify: (_) {
        verify(signInRepository.signInWithApple(any)).called(1);
        verifyNoMoreInteractions(signInRepository);
      },
    );
  });
}
