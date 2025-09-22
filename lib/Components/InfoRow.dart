import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final FontWeight? labelFontWeight;
  final FontWeight? valueFontWeight;
  final double? labelFontSize;
  final double? valueFontSize;
  final Color? labelColor;
  final Color? valueColor;
  final double? labelWidth;

  const InfoRow({
    Key? key,
    required this.label,
    required this.value,
    this.labelFontWeight,
    this.valueFontWeight,
    this.labelFontSize,
    this.valueFontSize,
    this.labelColor,
    this.valueColor,
    this.labelWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: labelColor ?? Color(0xff6D6D6D),
              fontWeight: labelFontWeight ?? FontWeight.w500,
              fontFamily: 'Roboto',
              fontSize: labelFontSize ?? 16,
            ),
          ),
        ),
        Text(
          ":",
          style: TextStyle(
            color: Color(0xff6D6D6D),
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              value,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: TextStyle(
                color: valueColor ?? Color(0xff333333),
                fontWeight: valueFontWeight ?? FontWeight.w500,
                fontFamily: 'Roboto',
                fontSize: valueFontSize ?? 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
class InfoRow1 extends StatelessWidget {
  final String label;
  final String value;
  final FontWeight? labelFontWeight;
  final FontWeight? valueFontWeight;
  final double? labelFontSize;
  final double? valueFontSize;
  final Color? labelColor;
  final Color? valueColor;
  final double? labelWidth;

  const InfoRow1({
    Key? key,
    required this.label,
    required this.value,
    this.labelFontWeight,
    this.valueFontWeight,
    this.labelFontSize,
    this.valueFontSize,
    this.labelColor,
    this.valueColor,
    this.labelWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: labelColor ?? Color(0xff6D6D6D),
              fontWeight: labelFontWeight ?? FontWeight.w500,
              fontFamily: 'Roboto',
              fontSize: labelFontSize ?? 16,
            ),
          ),
        ),

        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              value,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: TextStyle(
                color: valueColor ?? Color(0xff333333),
                fontWeight: valueFontWeight ?? FontWeight.w500,
                fontFamily: 'Roboto',
                fontSize: valueFontSize ?? 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
