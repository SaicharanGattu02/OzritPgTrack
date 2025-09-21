import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CommonTextField1 extends StatelessWidget {
  final String? hint;
  final String? label;
  final Color? color;
  final Color? lableColor;
  final double? labelFontSize;
  final FontWeight? labelFontWeight;
  final int maxLines;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool isRead;

  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;

  const CommonTextField1({
    super.key,
    this.hint,
    this.color,
    this.lableColor,
    this.label,
    this.maxLines = 1,
    this.controller,
    this.labelFontSize,
    this.labelFontWeight,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.validator,
    this.isRead = false,
    this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: labelFontWeight ?? FontWeight.w500,
              fontSize: labelFontSize ?? 14,
              color: lableColor ?? const Color(0xff1F2937),
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          readOnly: isRead,

          inputFormatters: inputFormatters,
          onTap: onTap,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xff111827),
          ),
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: maxLines,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xff9CA3AF),
            ),
            filled: true,
            fillColor: color ?? const Color(0xffffffff),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}



class CommonDateField extends StatelessWidget {
  final String? hint;
  final String? label;
  final Color? color;
  final Color? labelColor;
  final double? labelFontSize;
  final FontWeight? labelFontWeight;
  final TextEditingController? controller;
  final void Function(DateTime)? onDateSelected;
  final bool isRead;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CommonDateField({
    super.key,
    this.hint,
    this.label,
    this.color,
    this.labelColor,
    this.labelFontSize,
    this.labelFontWeight,
    this.controller,
    this.onDateSelected,
    this.isRead = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: labelFontWeight ?? FontWeight.w500,
              fontSize: labelFontSize ?? 14,
              color: labelColor ?? const Color(0xff1F2937),
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          readOnly: true,
          controller: controller,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xff111827),
          ),
          onTap: () async {
            if (isRead) return;
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );

            if (pickedDate != null) {
              controller?.text = DateFormat('yyyy-MM-dd').format(pickedDate);
              if (onDateSelected != null) {
                onDateSelected!(pickedDate);
              }
            }
          },
          decoration: InputDecoration(
            hintText: hint ?? "Select date",
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xff9CA3AF),
            ),
            filled: true,
            fillColor: color ?? const Color(0xffffffff),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon ?? const Icon(Icons.calendar_today),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
