import 'package:flutter/material.dart';
// import 'package:salam/core/constants/colors.dart';

class PaymentContainer extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentContainer({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected
              ? Colors.white.withOpacity(0.5)
              : Colors.white.withOpacity(0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              !isSelected
                  ? Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffAFABA5),
                          width: 2.0, // set the width of the border
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    )
                  : Image.asset(
                      'assets/activec.png',
                      scale: 3,
                    ),
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(
                  color:
                      isSelected ? Colors.black : Colors.black.withOpacity(0.7),
                  fontSize: 14,
                  height: 1.4,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
