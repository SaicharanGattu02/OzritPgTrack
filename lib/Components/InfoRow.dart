import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({Key? key, required this.label, required this.value})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xff6D6D6D),
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
              fontSize: 16,
            ),
          ),
        ),
        const Text(
          ":",
          style: const TextStyle(
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
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                color: Color(0xff333333),
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
                fontSize: 16,
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
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? labelwidth;

  const InfoRow1({
    Key? key,
    required this.label,
    required this.value,
    this.fontWeight,
    this.fontSize,
    this.labelwidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: labelwidth ?? width * 0.25,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
              fontSize: 16,
            ),
          ),
        ),
        Text(
          ":",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
            fontSize: 13,
          ),
        ),
        SizedBox(width: 6),
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              textAlign: TextAlign.start,
              value,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: TextStyle(
                color: Color(0xff666666),
                fontWeight: fontWeight ?? FontWeight.w500,
                letterSpacing: 0,
                fontSize: fontSize ?? 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
