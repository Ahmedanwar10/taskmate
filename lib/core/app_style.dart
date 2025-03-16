import 'package:flutter/material.dart';
import 'package:taskmate_app/core/constants/color_manager.dart';

abstract class AppStyles {
  static TextStyle styleSomarSansBold20(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff5F33E1), // بنفسجي رئيسي
        fontFamily: 'SomarSans',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
  static TextStyle styleSomarSansBold18(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : Colors.grey, // بنفسجي رئيسي
        fontFamily: 'SomarSans',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  static TextStyle styleSomarSansBold20black(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff2C2C54), // أزرق داكن
        fontFamily: 'SomarSans',
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );
      
  static TextStyle styleSomarSanssemiBold10(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? ColorManager.black
            : ColorManager.lightGrey, // أزرق داكن
        fontFamily: 'SomarSans',
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );

  static TextStyle styleSomarSansMedium20(BuildContext context) =>
      const TextStyle(
        color: Color(0xff6C63FF),
        fontFamily: 'SomarSans',
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );

  static TextStyle styleSomarSansMedium16(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff3B3B58), // رمادي مزرق
        fontFamily: 'SomarSans',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  static TextStyle styleSomarSansSemiBold6(BuildContext context) =>
      const TextStyle(
        color: Colors.white,
        fontFamily: 'SomarSans',
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  static TextStyle styleSomarSansSemiBold26(BuildContext context) =>
      const TextStyle(
        color: Color(0xff6C63FF), // بنفسجي فاتح
        fontFamily: 'SomarSans',
        fontSize: 26,
        fontWeight: FontWeight.w600,
      );
  static TextStyle styleSomarSansSemiBold20(BuildContext context) =>
      const TextStyle(
        color: Color(0xff6C63FF), // بنفسجي فاتح
        fontFamily: 'SomarSans',
        fontSize: 26,
        fontWeight: FontWeight.w600,
      );

  static TextStyle styleSomarSansBold16(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff2C2C54), // أزرق داكن
        fontFamily: 'SomarSans',
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );

  static TextStyle styleSomarSansRegular16(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff3B3B58), // رمادي مزرق
        fontFamily: 'SomarSans',
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  static TextStyle styleSomarSansMedium14(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff7878A3), // رمادي فاتح مزرق
        fontFamily: 'SomarSans',
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  static TextStyle styleSomarSansRegular14(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff3B3B58), // رمادي مزرق
        fontFamily: 'SomarSans',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );

  static TextStyle styleSomarSansBold12(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff2C2C54), // أزرق داكن
        fontFamily: 'SomarSans',
        fontSize: 12,
        fontWeight: FontWeight.w700,
      );

  static TextStyle styleSomarSansBold14(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff2C2C54), // أزرق داكن
        fontFamily: 'SomarSans',
        fontSize: 14,
        fontWeight: FontWeight.w700,
      );

  static TextStyle styleSomarSansLight10(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xffB0B0D9), // رمادي مائل للبنفسجي الفاتح
        fontFamily: 'SomarSans',
        fontSize: 10,
        fontWeight: FontWeight.w300,
      );

  static TextStyle styleSomarSansRegular12(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xffB0B0D9), // رمادي فاتح مائل للبنفسجي
        fontFamily: 'SomarSans',
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );
}
