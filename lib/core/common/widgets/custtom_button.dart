import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.color,
    this.icon,
    this.textStyle,
  });

  final String text;
  final VoidCallback onPressed;
  final Widget? icon;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipPath(
        child: Container(
          width: width, //
          height: height, //
          decoration: BoxDecoration(
            color: color ?? const Color(0xFFEDE5FF),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(2, 4), //
              )
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: textStyle ??
                const TextStyle(
                  color: Color(0xFF5A2ECC),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
