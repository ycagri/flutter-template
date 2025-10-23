import 'package:flutter_template/sign_in/sign_in_cubit.dart';
import 'package:flutter_template/sign_in/sign_in_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<ImagePicker>(),
  MockSpec<GoRouter>(),
  MockSpec<SignInCubit>(),
  MockSpec<SignInRepository>(),
])
void main() {}
