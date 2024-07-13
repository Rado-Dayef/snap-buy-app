import 'package:firebase_auth/firebase_auth.dart';
import 'package:snap_buy/constants/strings.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// To sign up with email, and password.
  Future<dynamic> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        await user.sendEmailVerification();
        return user;
      }
      return Strings.unknownErrorText;
    } on FirebaseAuthException catch (error) {
      if (error.code == Strings.emailAlreadyInUseErrorCode) {
        return Strings.emailAlreadyInUseText;
      } else if (error.code == Strings.networkRequestFailedErrorCode) {
        return Strings.pleaseCheckYourInternetConnectionText;
      }
      return Strings.unknownErrorText;
    } catch (error) {
      return error.toString();
    }
  }

  /// To login with email, and password.
  Future<dynamic> login(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null && !user.emailVerified) {
        return Strings.pleaseVerifyYourEmailFirstText;
      }
      return user;
    } on FirebaseAuthException catch (error) {
      if (error.code == Strings.userNotFoundErrorCode) {
        return Strings.userNotFoundPleaseCheckYourEmailAddressText;
      } else if (error.code == Strings.wrongPasswordErrorCode) {
        return Strings.wrongPasswordProvidedForThatUserText;
      } else if (error.code == Strings.invalidEmailErrorCode) {
        return Strings.invalidEmailValidation;
      } else if (error.code == Strings.invalidCredentialErrorCode) {
        return Strings.pleaseMakeSureThatYouHaveSignedUpWithThatEmailAndPasswordText;
      } else if (error.code == Strings.networkRequestFailedErrorCode) {
        return Strings.pleaseCheckYourInternetConnectionText;
      }
      return Strings.unknownErrorText;
    } catch (error) {
      return error.toString();
    }
  }

  /// To send reset password email.
  Future<String?> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return Strings.passwordResetEmailSentPleaseCheckYourInboxText;
    } on FirebaseAuthException catch (error) {
      if (error.code == Strings.userNotFoundErrorCode) {
        return Strings.userNotFoundPleaseCheckYourEmailAddressText;
      } else {
        return null;
      }
    } catch (error) {
      return error.toString();
    }
  }

  /// To sign out from the current account.
  Future<String> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return Strings.signedOutText;
    } on FirebaseAuthException catch (error) {
      if (error.code == Strings.networkRequestFailedErrorCode) {
        return Strings.pleaseCheckYourInternetConnectionText;
      }
      return Strings.unknownErrorText;
    } catch (error) {
      return error.toString();
    }
  }
}
