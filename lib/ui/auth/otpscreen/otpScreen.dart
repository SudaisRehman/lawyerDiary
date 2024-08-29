import 'package:flutter/material.dart';
import 'package:lawyer_diary/ui/auth/set_password/set_password.dart';
import 'package:lawyer_diary/ui/custom_widget/custom_button.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId; // Verification ID received from Firebase

  OtpScreen(
      {required this.verificationId}); // Constructor to receive Verification ID

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late String _otpCode; // Variable to store OTP code

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Colors.greenAccent,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        border: Border.all(color: Colors.white.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color(0xffE4633E)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.white,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Container(
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
                      'Verify it’s you',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Outfit",
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'We send a code to your phone. Enter it here to verify your identity',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontFamily: "Outfit",
                      ),
                    ),
                    SizedBox(height: 50),
                    Pinput(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      length: 6,
                      focusedPinTheme: focusedPinTheme,
                      defaultPinTheme: defaultPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      onChanged: (value) {
                        setState(() {
                          _otpCode = value;
                        });
                      },
                    ),
                    SizedBox(height: 85),
                    InkWell(
                      onTap: () {
                        // Implement OTP verification logic here
                        if (_otpCode == widget.verificationId) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SetPasswordScreen(),
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Invalid OTP'),
                              content: Text('Please enter the correct OTP.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: CustomButton(
                        text: 'Done',
                        color: Colors.greenAccent,
                        onPressed: () {
                          // You can implement OTP verification here using _otpCode and widget.verificationId
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        "Resend Code",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        "00:59 sec",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
