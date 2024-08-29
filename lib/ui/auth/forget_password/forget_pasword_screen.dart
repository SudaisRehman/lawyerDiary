import 'package:flutter/material.dart';
import 'package:lawyer_diary/ui/auth/change_password/change_Password.dart';
import 'package:provider/provider.dart';

import '../../custom_widget/custom_button.dart';
import '../../custom_widget/custom_country_picker.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  'Forget Password',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePassword()));
                  },
                  child: CustomButton(
                    text: 'Send',
                    color: Colors.greenAccent,
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
