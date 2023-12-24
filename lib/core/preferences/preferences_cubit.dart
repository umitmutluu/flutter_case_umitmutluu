import 'dart:ui';

import 'package:bloc/bloc.dart' show Cubit;
import 'package:equatable/equatable.dart';
import 'package:flutter_case_umitmutluu/core/l10n/l10n.dart';

part 'preferences_state.dart';

class PreferencesCubit extends Cubit<PreferencesState> with EquatableMixin {
  PreferencesCubit() : super(const PreferencesState());

  Future<void> changeLocale(Locale? locale) async {
    if (locale == null) return;
    emit(state.copyWith(locale: locale));
  }

  PreferencesState? fromJson(Map<String, dynamic> json) {
    return PreferencesState(
      locale:
          Locale(json['locale']['languageCode'], json['locale']['countryCode']),
    );
  }

  Map<String, dynamic>? toJson(PreferencesState state) {
    return {
      'locale': state.locale?.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        state.locale,
      ];
}
