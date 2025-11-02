import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_template/common/bloc_state.dart';
import 'package:flutter_template/podo/profile.dart';
import 'package:flutter_template/profile/profile_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../utils/mocks.mocks.dart';

void main() {
  final profileRepository = MockProfileRepository();

  group('ProfileCubitTest', () {
    tearDown(() {
      clearInteractions(profileRepository);
    });

    blocTest<ProfileCubit, ProfileState>(
      'SignedInTest',
      setUp: () {
        when(
          profileRepository.isSignedIn(),
        ).thenAnswer((_) => Future.value(true));
      },
      build: () => ProfileCubit(profileRepository),
      act: (bloc) => bloc.isSignedIn(),
      expect:
          () => [
            ProfileState(isLoading: true, profile: null),
            ProfileState(isLoading: false, profile: Profile()),
          ],
      verify: (_) {
        verify(profileRepository.isSignedIn()).called(1);
        verifyNoMoreInteractions(profileRepository);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'NotSignedInTest',
      setUp: () {
        when(
          profileRepository.isSignedIn(),
        ).thenAnswer((_) => Future.value(false));
      },
      build: () => ProfileCubit(profileRepository),
      act: (bloc) => bloc.isSignedIn(),
      expect:
          () => [
            ProfileState(isLoading: true, profile: null),
            ProfileState(isLoading: false, profile: null),
          ],
      verify: (_) {
        verify(profileRepository.isSignedIn()).called(1);
        verifyNoMoreInteractions(profileRepository);
      },
    );
  });
}
