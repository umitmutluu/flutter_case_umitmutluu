import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case_umitmutluu/bloc_observer.dart';
import 'package:flutter_case_umitmutluu/core/service/locator_service.dart';
import 'package:flutter_case_umitmutluu/presentation/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


  await locatorInitialize();
  Bloc.observer = const AppBlocObserver();
  runApp(App());
}
