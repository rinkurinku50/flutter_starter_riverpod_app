import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/app.dart';
import 'package:flutter_starter/data/dependency_injection/environment.dart';
import 'package:flutter_starter/data/dependency_injection/injection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureDependencies(environment: Env.webStaging);
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en'),
    ],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    child: const ProviderScope(child: MyApp()),
  ));
}
