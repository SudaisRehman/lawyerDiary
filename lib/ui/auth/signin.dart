import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_diary/ui/auth/login_screen/login_screen.dart';
import 'package:lawyer_diary/ui/auth/otpscreen/otpScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore package
import 'package:lawyer_diary/ui/auth/siginUp_provider.dart';
import 'package:lawyer_diary/ui/custom_widget/custom_button.dart';
import 'package:lawyer_diary/ui/custom_widget/custom_country_picker.dart';
import 'package:lawyer_diary/ui/custom_widget/custom_textfield.dart';
import 'package:lawyer_diary/ui/terms_conditions/terms_condition.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to sign up user with phone number
  Future<void> _signUpWithPhone(BuildContext context) async {
    try {
      // Start phone authentication process
      final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
        print("Auto retrieval time out");
      };

      final PhoneCodeSent smsCodeSent =
          (String verId, [int? forceCodeResend]) async {
        // Navigate to OTP screen with verification ID
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(verificationId: verId),
          ),
        );
      };

      final PhoneVerificationCompleted verifiedSuccess =
          (AuthCredential authResult) async {
        print(
            "Phone number automatically verified and user signed in: $authResult");
      };

      final PhoneVerificationFailed veriFailed =
          (FirebaseAuthException exception) {
        print("${exception.message}");
      };

      await _auth.verifyPhoneNumber(
        phoneNumber:
            '+${phoneController.text}', // Add country code to phone number
        timeout: const Duration(seconds: 60),
        verificationCompleted: verifiedSuccess,
        verificationFailed: veriFailed,
        codeSent: smsCodeSent,
        codeAutoRetrievalTimeout: autoRetrieve,
      );
    } catch (e) {
      print(e);
    }
  }

  // Function to store user data in Firestore
  Future<void> _storeUserDataInFirestore(
      BuildContext context, User user) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'firstName': firstNameController.text.trim(),
        'lastName': lastNameController.text.trim(),
        'email': emailController.text.trim(),
        'phone': phoneController.text.trim(),
      });
    } catch (e) {
      // print("Error storing user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupProvider(),
      child: Consumer<SignupProvider>(
        builder: (context, model, _) {
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 220, 216, 216),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/backarrow.png',
                            scale: 3,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Sign up',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Lorem ipsum dolor sit amet, cons v ipsum dolor sit ectetur adi ons v ipsupiscing elit..',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(height: 20),
                        // First Name and Last Name input fields
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: firstNameController,
                                hintText: 'First Name',
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: CustomTextField(
                                controller: lastNameController,
                                hintText: 'Last Name',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        // Email input field
                        CustomTextField(
                          controller: emailController,
                          hintText: 'Email',
                        ),
                        SizedBox(height: 20),
                        // Phone Number input field
                        CustomTextField(
                          controller: phoneController,
                          hintText: 'Phone Number',
                        ),
                        SizedBox(height: 20),
                        // Checkbox for terms and conditions
                        Row(
                          children: [
                            Checkbox(
                              value: model.rememberMe,
                              onChanged: (value) {
                                model.toggleCheckbox();
                              },
                            ),
                            Text(
                              'I agree to the ',
                              style: TextStyle(fontSize: 14),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigate to terms and conditions screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TermsAndCondition()),
                                );
                              },
                              child: Text(
                                'Terms & Conditions',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        // Sign Up button
                        InkWell(
                          onTap: () {
                            if (model.rememberMe == true) {
                              _signUpWithPhone(context);
                            }
                          },
                          child: CustomButton(
                            text: 'Sign Up',
                            color: Colors.greenAccent,
                          ),
                        ),
                        SizedBox(height: 30),
                        // Text for already have an account with login link
                        Center(
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Already have an Account? ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LogInScreen()),
                                      );
                                    },
                                  text: 'Login',
                                  style: TextStyle(
                                    color: Colors.greenAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
