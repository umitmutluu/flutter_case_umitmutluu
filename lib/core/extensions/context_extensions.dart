import 'package:flutter/cupertino.dart';
import 'package:flutter_case_umitmutluu/core/constants/color_constants.dart';
import 'package:flutter_case_umitmutluu/core/l10n/l10n.dart';

extension ThemeModeExtension on BuildContext {
  bool get isDarkMode => CupertinoTheme.brightnessOf(this) == Brightness.dark;

  Color get primaryColor =>
      CupertinoDynamicColor.resolve(ColorConstants.primaryColor, this);

  Color get labelCross =>
      CupertinoDynamicColor.resolve(ColorConstants.labelCross, this);

  Color get label => CupertinoDynamicColor.resolve(ColorConstants.label, this);

  Color get itemBackGround =>
      CupertinoDynamicColor.resolve(ColorConstants.itemBackGroundColor, this);
  Color get itemBackGround2 =>
      CupertinoDynamicColor.resolve(ColorConstants.itemBackGroundColor2, this);

  String titleValue(int number) {
    switch (number) {
      case 0:
        return translate.combinedTitle_0;
      case 2:
        return translate.combinedTitle_1;
      case 5:
        return translate.combinedTitle_2;
      default:
        return translate.combinedTitle_0;
    }
  }
}
