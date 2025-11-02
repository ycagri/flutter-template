import 'package:equatable/equatable.dart';
import 'package:flutter_template/common/enums.dart';
import 'package:flutter_template/podo/profile.dart';

class SignInState extends Equatable {
  final SignInStatus status;

  const SignInState({required this.status});

  @override
  List<Object?> get props => [status];
}

class ProfileState extends Equatable {
  final bool isLoading;

  final Profile? profile;

  const ProfileState({required this.isLoading, required this.profile});

  @override
  List<Object?> get props => [isLoading, profile];
}
