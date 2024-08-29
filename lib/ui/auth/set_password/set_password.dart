import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lawyer_diary/ui/Home/home.dart';
import 'package:lawyer_diary/ui/auth/signin.dart';
import 'package:lawyer_diary/ui/custom_widget/custom_button.dart';

import 'package:provider/provider.dart';

import '../../custom_widget/custom_textfield.dart';
import '../login_screen/login_screen_provider.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => SignUp()),
                        (Route<dynamic> route) => false);
                  },
                  child: Image.asset(
                    'assets/backarrow.png',
                    scale: 3,
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                'Set Password',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Password',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
                    model.isvisible ? Icons.visibility_off : Icons.visibility,
                    color: model.isvisible ? Colors.grey : Colors.greenAccent,
                  ),
                ),
                hintText: 'Enter Password',
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Confirm Password',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                obscureText: model.isPasword,
                suffixIcon: IconButton(
                  onPressed: () {
                    model.fornew();
                  },
                  icon: Icon(
                    model.isPasword ? Icons.visibility_off : Icons.visibility,
                    color: model.isPasword ? Colors.grey : Colors.greenAccent,
                  ),
                ),
                hintText: 'Confirm your Password',
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: CustomButton(
                  text: 'Save Password',
                  color: Colors.greenAccent,
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
