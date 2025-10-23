import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

abstract class SignInRepository {
  final GoogleSignIn _googleSignIn;

  SignInRepository(this._googleSignIn);

  Future<bool> signInWithGoogle() {
    return _googleSignIn.authenticate(scopeHint: ['email', 'profile']).then((
      account,
    ) {
      final GoogleSignInAuthentication auth = account.authentication;
      final String? idToken = auth.idToken;
      if (idToken != null) {
        return _signInWithGoogle(idToken);
      }
      throw Exception("Id token is null!");
    });
  }

  Future<bool> isSignedIn();

  Future<bool> _signInWithGoogle(String idToken);

  Future<bool> signInWithApple(String rawNonce);
}

@Injectable(as: SignInRepository)
class SignInRepositoryImpl extends SignInRepository {
  // TODO: Implement your sign in logic here
  SignInRepositoryImpl(super.googleSignIn);

  @override
  Future<bool> _signInWithGoogle(String idToken) {
    // TODO: implement _signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignedIn() {
    // TODO: implement isSignedIn
    throw UnimplementedError();
  }

  @override
  Future<bool> signInWithApple(String rawNonce) {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }
}
