import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

const serverClientId = 'yourGoogleServerClientId';

@module
abstract class RegisterModule {
  @singleton
  ImagePicker get imagePicker => ImagePicker();

  @singleton
  GoogleSignIn get googleSignIn {
    GoogleSignIn.instance.initialize(serverClientId: serverClientId);
    return GoogleSignIn.instance;
  }
}

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() {
  $initGetIt(getIt);
}
