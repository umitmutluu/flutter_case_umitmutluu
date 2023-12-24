import 'package:flutter/material.dart';
import 'package:flutter_case_umitmutluu/core/l10n/l10n.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';
extension AppLocalizationsExtension on BuildContext {
  AppLocalizations get translate => AppLocalizations.of(this)!;

  Locale get currentLocale => Localizations.localeOf(this);

  List<Locale> get supportedLocales => AppLocalizations.supportedLocales;
}

extension LocaleX on Locale {
  String get languageCode => this.languageCode;

  String get label {
    switch (this.languageCode) {
      case 'tr':
        return 'Türkçe';
      case 'en':
        return 'English';
      default:
        return 'Türkçe';
    }
  }
}
