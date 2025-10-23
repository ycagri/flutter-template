import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/common/bloc_state.dart';
import 'package:flutter_template/common/enums.dart';
import 'package:flutter_template/sign_in/sign_in_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final SignInRepository _repository;

  SignInCubit(this._repository)
    : super(SignInState(status: SignInStatus.loading));

  void isSignedIn() {
    _repository.isSignedIn().then(
      (isSignedIn) =>
          isSignedIn
              ? emit(SignInState(status: SignInStatus.signInSuccessful))
              : emit(SignInState(status: SignInStatus.notSignedIn)),
    );
  }

  void signInWithGoogle() {
    emit(SignInState(status: SignInStatus.loading));
    _repository.signInWithGoogle().then(
      (isSignedIn) =>
          isSignedIn
              ? emit(SignInState(status: SignInStatus.signInSuccessful))
              : emit(SignInState(status: SignInStatus.signInFailure)),
      onError: (e) => emit(SignInState(status: SignInStatus.signInFailure)),
    );
  }

  void signInWithApple() {
    emit(SignInState(status: SignInStatus.loading));
    _repository
        .signInWithApple(_generateNonce())
        .then(
          (isSignedIn) =>
              isSignedIn
                  ? emit(SignInState(status: SignInStatus.signInSuccessful))
                  : emit(SignInState(status: SignInStatus.signInFailure)),
          onError: (e) => emit(SignInState(status: SignInStatus.signInFailure)),
        );
  }

  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }
}
