import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String text;
  final Color color;
  final double fontSize;
  final Color fontColor;
  final Color borderColor;
  final double width;
  final double height;
  final double hPad;
  final onPressed;

  CustomButton({
    super.key,
    required this.text,
    this.color = const Color(0XFFE40001),
    this.fontColor = Colors.white,
    this.borderColor = const Color(0xFF4C4DDC),
    this.fontSize = 16.0,
    this.width = double.infinity,
    this.height = 52.0,
    this.hPad = 0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return
        // Padding(
        // padding: EdgeInsets.symmetric(horizontal: (20 + hPad), vertical: 5),
        // child:
        Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize,
              color: fontColor,
              fontWeight: FontWeight.w600),
        ),
      ),
      // ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  String text;
  String iconUrl;
  final Color color;
  final double fontSize;
  final Color fontColor;
  final Color borderColor;
  final double width;
  final double height;
  final double hPad;

  /// Custom Button 2>>>>>>>>>>>
  CustomButton2({
    required this.text,
    required this.iconUrl,
    this.color = Colors.blue,
    this.fontColor = Colors.black,
    this.borderColor = const Color(0xFF4C4DDC),
    this.fontSize = 15.0,
    this.width = double.infinity,
    this.height = 52.0,
    this.hPad = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(iconUrl, height: 30),
          Text(
            text,
          ),
          SizedBox(),
        ],
      ),
    );
  }
}
