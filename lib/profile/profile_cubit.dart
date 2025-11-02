import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/profile/profile_repository.dart';
import 'package:injectable/injectable.dart';

import '../common/bloc_state.dart';
import '../podo/profile.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileCubit(this._profileRepository)
    : super(ProfileState(isLoading: true, profile: null));

  void isSignedIn() {
    emit(ProfileState(isLoading: true, profile: state.profile));
    _profileRepository.isSignedIn().then((value) {
      emit(ProfileState(isLoading: false, profile: value ? Profile() : null));
    });
  }
}
