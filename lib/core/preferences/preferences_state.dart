part of 'preferences_cubit.dart';


class PreferencesState extends Equatable {
  const PreferencesState({
    this.locale,
  });
  final Locale? locale;

  List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  PreferencesState copyWith({
    Locale? locale,
    Brightness? brightness,
  }) {
    return PreferencesState(
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object?> get props => [
    locale,
  ];
}

extension LocaleX on Locale {
  Map<String, String?> toJson() {
    return {
      'languageCode': languageCode,
      'countryCode': countryCode,
    };
  }

  Locale fromJson(Map<String, dynamic> json) {
    return Locale(
      json['languageCode'] as String,
      json['countryCode'] as String,
    );
  }
}
