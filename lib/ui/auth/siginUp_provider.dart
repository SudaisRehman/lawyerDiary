import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignupProvider extends ChangeNotifier {
  bool rememberMe = false;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  void toggleCheckbox() {
    rememberMe = !rememberMe;
    notifyListeners();
  }

  // verifywithphone(
  //     BuildContext context, String text, String text, String text) {
  //   _auth.verifyPhoneNumber(
  //       phoneNumber: '+44 7123 123 456',
  //       verificationCompleted: (_) {},
  //       verificationFailed: (e) {
  //         if (e.code == 'invalid-phone-number') {
  //           print('The provided phone number is not valid.');
  //         }
  //       },
  //       codeSent: (String verificationId, int? resendToken) {
  //         Navigator.push(
  //           context as BuildContext,
  //           MaterialPageRoute(
  //             builder: (context) => OtpScreen(VerificationId: verificationId),
  //           ),
  //         );
  //         //   // Update the UI - wait for the user to enter the SMS code
  //         //   String smsCode = 'xxxx';
  //         //   // Create a PhoneAuthCredential with the code
  //         //   PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
  //         //   // Sign the user in (or link) with the credential
  //         //   _auth.signInWithCredential(phoneAuthCredential);
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {
  //         // Auto-resolution timed out...
  //       });
  // }

  // Future<void> verifywithphone()async{
  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: '+44 7123 123 456',
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       await _auth.signInWithCredential(credential);
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       if (e.code == 'invalid-phone-number') {
  //         print('The provided phone number is not valid.');
  //       }
  //     },
  //     codeSent: (String verificationId, int? resendToken) async {
  //       // Update the UI - wait for the user to enter the SMS code
  //       String smsCode = 'xxxx';
  //       // Create a PhoneAuthCredential with the code
  //       PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
  //       // Sign the user in (or link) with the credential
  //       await _auth.signInWithCredential(phoneAuthCredential);
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       // Auto-resolution timed out...
  //     },
  //   );
  //}
}
