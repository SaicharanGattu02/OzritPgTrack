import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar1 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;
  final Color? containerColor;
  final Color? titleColor;
  final List<Widget> actions;

  const CustomAppBar1({
    Key? key,
    required this.title,
    required this.actions,
    this.color,
    this.containerColor,
    this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leadingWidth: 48,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: GestureDetector(
          onTap: () => context.pop(true),
          child: Container(
            height: 40,
            width: 40,
            decoration:  BoxDecoration(
              color: containerColor ?? Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              size: 22,
              color: Color(0xff4B5563),
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style:  TextStyle(
          color: titleColor??Color(0xff111827),
          fontSize: 20,fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
