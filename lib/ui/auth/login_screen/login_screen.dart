import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_diary/ui/auth/forget_password/forget_pasword_screen.dart';
import 'package:lawyer_diary/ui/auth/otpscreen/otpScreen.dart';
import 'package:lawyer_diary/ui/auth/signin.dart';
import 'package:lawyer_diary/ui/custom_widget/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../../custom_widget/custom_button.dart';
import '../../custom_widget/custom_country_picker.dart';
import 'login_screen_provider.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Consumer<LoginProvider>(builder: (context, model, _) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
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
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, cons v ipsum dolor sit ectetur adi ons v ipsupiscing elit..',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Phone Number',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CountryCodePickerWithText(
                      controller: phoneController,
                      initialSelection: '+1',
                      onChanged: (countryCode) {
                        print('Selected country code: $countryCode');
                      },
                      // hintText: 'phone number',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Password',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      obscureText: model.isvisible,

                      suffixIcon: IconButton(
                        onPressed: () {
                          model.visiblePassword();
                        },
                        icon: Icon(
                          model.isvisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: model.isvisible
                              ? Colors.grey
                              : Colors.greenAccent,
                        ),
                      ),
                      // Use email keyboard type
                      // suffixIcon: !model.isvisible
                      //     ? Image.asset(
                      //         'assets/hide.png',
                      //         scale: 3,
                      //       )
                      //     : Icon(Icons.remove_red_eye, color: PrimaryColor),
                      hintText: 'Enter your Pasword',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        model.toggleCheckbox();
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 18.0,
                            height: 18.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: model.rememberMe
                                    ? Colors.greenAccent
                                    : Colors.grey,
                                width: 0.7,
                              ),
                              color: model.rememberMe
                                  ? Colors.greenAccent
                                  : Colors.white,
                            ),
                            child: model.rememberMe
                                ? Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 12.0,
                                  )
                                : null,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Remember me',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgetPassword()));
                            },
                            child: Text(
                              'Forgot Password ?',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OtpScreen(
                                  verificationId: 'your_verification_id_here')),
                        );
                      },
                      child: CustomButton(
                        text: 'Login ',
                        color: Colors.greenAccent,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            indent: 10,
                            thickness: 0.5,
                            endIndent: 10,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        Text("or"),
                        Expanded(
                          child: Divider(
                            indent: 10,
                            thickness: 0.5,
                            endIndent: 10,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Image.asset(
                                'assets/google.png',
                                scale: 3,
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              onTap: () {},
                              child: Image.asset(
                                'assets/apple.png',
                                scale: 3,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Already have an Account?',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()));
                                },
                              text: 'SigUP',
                              style: TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ),
        );
      }),
    );
  }
}
