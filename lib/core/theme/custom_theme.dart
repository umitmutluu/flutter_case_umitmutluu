import 'package:flutter/material.dart';
import 'package:flutter_case_umitmutluu/core/extensions/context_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomThemeData {
  CustomThemeData(this.context);

  final BuildContext context;

  ThemeData get themeData => ThemeData(
        scaffoldBackgroundColor: context.isDarkMode
            ? const Color(0xFF000000)
            : const Color(0xFFFFFFFF),
        useMaterial3: false,
        colorScheme: context.isDarkMode
            ? const ColorScheme.dark()
            : const ColorScheme.light(),
        typography: Typography.material2021(),
        fontFamily: 'Poppins',
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: context.primaryColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.primaryColor,
            ),
            borderRadius: BorderRadius.circular(12.sp),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.primaryColor,
            ),
            borderRadius: BorderRadius.circular(12.sp),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.primaryColor,
            ),
            borderRadius: BorderRadius.circular(12.sp),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.primaryColor,
            ),
            borderRadius: BorderRadius.circular(12.sp),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.primaryColor,
            ),
            borderRadius: BorderRadius.circular(12.sp),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(context.primaryColor),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        listTileTheme: ListTileThemeData(
          contentPadding: EdgeInsets.zero,
          iconColor: context.label,
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: context.label,
          ),
        ),
      );
}
