import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;

  const CustomChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return RawChip(
      showCheckmark: false,
      labelPadding: const EdgeInsets.symmetric(horizontal: 12),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      label: Text(
        label,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: selected ? const Color(0xFFFFFFFF) : Color(0xff4B5563),
        ),
      ),
      selected: selected,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      onSelected: onSelected,
      selectedColor: selected ? Color(0xFF6C6ED3) : Color(0xFFF3F4F6),
      backgroundColor: Colors.white,
      pressElevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: selected
            ? const BorderSide(color: Color(0xFF4076ED))
            : const BorderSide(color: Colors.transparent),
      ),
    );
  }
}
