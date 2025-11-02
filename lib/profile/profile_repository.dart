import 'package:injectable/injectable.dart';

abstract class ProfileRepository {
  ProfileRepository();

  Future<bool> isSignedIn();
}

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  // TODO: Implement your sign in logic here
  ProfileRepositoryImpl();

  @override
  Future<bool> isSignedIn() {
    // TODO: Implement your sign in control logic here
    throw UnimplementedError();
  }
}
