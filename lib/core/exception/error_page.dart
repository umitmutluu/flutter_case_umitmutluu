import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_case_umitmutluu/core/l10n/l10n.dart';
@RoutePage()
final class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Text(context.translate.errorPage)),
    );
  }
}
