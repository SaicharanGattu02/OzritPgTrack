import 'package:flutter/material.dart';


class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const FilterButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(padding: EdgeInsets.all(8),visualDensity: VisualDensity.compact,
          backgroundColor: isSelected
              ? Color(0xff7453AD)
              : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadowColor: Colors.transparent,
          overlayColor: Colors.transparent,
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? Color(0xffFFFFFF) : Color(0xff4B5563),
          ),
        ),
      ),
    );
  }
}
