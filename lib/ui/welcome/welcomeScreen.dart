import 'package:flutter/material.dart';
import 'package:lawyer_diary/ui/auth/login_screen/login_screen.dart';
import 'package:lawyer_diary/ui/auth/signin.dart';
import 'package:lawyer_diary/ui/custom_widget/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final space = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //SizedBox(height: screenHeight * 0.15),

          /// Welcome Text >>>>

          // SizedBox(height: screenHeight * 0.03),

          Container(
            height: 510,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/girl.png",
                    ),
                    fit: BoxFit.cover)),
          ),

          //Expanded(child: SizedBox()),

          /// Bottom Container >>>>
          Expanded(
            child: Container(
              // height: 330,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Welcome to Lawyer Diary",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      "We are here to help you to find the best lawyer for your case",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),

                  SizedBox(height: 20),

                  /// Job Selection Buttons >>>>
                  InkWell(
                      onTap: () {
                        /// Navigation to SignIn Screen ===>>>
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: CustomButton(
                        text: "Sign up",
                        color: Colors.greenAccent,
                      )),

                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      //Navigation to SignIn Screen ===>>>
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogInScreen()));
                    },
                    child: CustomButton(
                      text: "Login",
                      color: Colors.white,
                      fontColor: Colors.greenAccent,
                    ),
                  ),

                  //SizedBox(height: screenHeight * 0.08),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
