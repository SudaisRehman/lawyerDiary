import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lawyer_diary/ui/Home/home.dart';
import 'package:lawyer_diary/ui/auth/login_screen/login_screen_provider.dart';
import 'package:lawyer_diary/ui/custom_widget/custom_button.dart';
import 'package:provider/provider.dart';

import '../../custom_widget/custom_textfield.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
          child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/backarrow.png',
                        scale: 3,
                      )),
                  Spacer(),
                  Text(
                    'Change Password',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer()
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Previous Password',
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
                'New Password',
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
                obscureText: model.isconfirmPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    model.confirm();
                  },
                  icon: Icon(
                    model.isconfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: model.isconfirmPassword
                        ? Colors.grey
                        : Colors.greenAccent,
                  ),
                ),
                hintText: 'Enter Password',
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
        ),
      )),
    );
  }
}
