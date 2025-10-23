import 'package:equatable/equatable.dart';
import 'package:flutter_template/common/enums.dart';

class SignInState extends Equatable {
  final SignInStatus status;

  const SignInState({required this.status});

  @override
  List<Object?> get props => [status];
}
