import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class CountryCodePickerWithText extends StatefulWidget {
  final String? initialSelection;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final TextEditingController controller;
  CountryCodePickerWithText({
    this.initialSelection,
    this.onChanged,
    this.hintText,
    required this.controller,
  });
  @override
  _CountryCodePickerWithTextState createState() =>
      _CountryCodePickerWithTextState();
}

class _CountryCodePickerWithTextState extends State<CountryCodePickerWithText> {
  String? selectedCountryCode;
  @override
  void initState() {
    super.initState();
    selectedCountryCode = widget.initialSelection;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Row(
              children: [
                CountryCodePicker(
                  showDropDownButton: false,
                  padding: EdgeInsets.all(0),
                  initialSelection: widget.initialSelection,
                  onChanged: (countryCode) {
                    setState(() {
                      selectedCountryCode = countryCode.dialCode;
                    });
                    if (widget.onChanged != null) {
                      widget.onChanged!(selectedCountryCode!);
                    }
                  },
                  favorite: ['+1', 'US'],
                  textStyle: TextStyle(fontSize: 12, color: Colors.black),
                  flagWidth: 25,
                  showFlagDialog: true,
                ),
                Image.asset(
                  'assets/droparrow.png',
                  scale: 3,
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
          ),
          SizedBox(width: 3),
          Expanded(
            flex: 3,
            child: TextFormField(
              controller: TextEditingController(),
              keyboardType: TextInputType.phone, // Use email keyboard type

              decoration: InputDecoration(
                hintText: 'Enter phone Number',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.5),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
              validator: (val) => val!.length != 10
                  ? 'Enter a mobile number of 10 digits'
                  : null,
              onChanged: (val) {},
            ),
          ),
        ],
      ),
    );
  }
}
