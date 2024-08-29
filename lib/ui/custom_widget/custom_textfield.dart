import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final onChanged;
  final validator;
  final hintText;
  final controller;
  final bool obscureText;
  final bool readOnly;
  final textInputAction;
  final keyBoardType;
  final suffixIcon;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  // final String? preFixIcon; // Change the type to String for the SVG asset path
  final preFixIcon;
  CustomTextField({
    this.preFixIcon, // Make the prefix icon optional
    this.readOnly = false,
    this.onChanged,
    this.controller,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.textInputAction,
    this.keyBoardType,
    this.suffixIcon,
    this.focusNode,
    this.onFieldSubmitted,
    EdgeInsets? contentPadding,
  });
  @override
  Widget build(BuildContext context) {
    // final space = Space(context);
    // final double screenHeight = space.screenHeight;
    // final double screenWidth = space.screenWidth;
    return Container(
      // height: screenHeight > 650 ? screenHeight * 0.06 : screenHeight * 0.10,
      // width: screenHeight > 650 ? screenHeight * 6 : screenHeight * 0.9,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        keyboardType: keyBoardType,
        readOnly: readOnly,
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Poppins-black',
        ),
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
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
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          hintText: hintText,
          hintStyle: TextStyle(
            //fontFamily: 'Poppins',
            color: Color(0xff060606).withOpacity(0.50),
            fontSize: 14.0,
            // color: LightGreyColor,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: preFixIcon,
          // prefixIcon: preFixIcon != null // Conditionally set the prefix icon
          //     ? Padding(
          //         padding: const EdgeInsets.all(12.0),
          //         child: SvgPicture.asset(
          //           preFixIcon!, // Use the provided SVG asset path
          //           color: LightGreyColor,
          //         ),
          //       )
          //     : null, // If preFixIcon is null, don't set a prefix icon
        ),
      ),
    );
  }
}
