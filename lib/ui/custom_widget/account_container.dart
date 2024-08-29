import 'package:flutter/material.dart';

class AmountContainer extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const AmountContainer({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.black.withOpacity(0.7),
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
