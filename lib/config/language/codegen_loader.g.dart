import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';

import 'Local_Key.g.dart';

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    // TODO: implement load
    return Future<Map<String, dynamic>>.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> ar = {
    LocalKeys.welcomeBack:"مرحبا بعودتك",
  };
  static const Map<String, dynamic> en = {
    LocalKeys.welcomeBack:"Welcome Back",
  };

  static const Map<String, Map<String, dynamic>> mapLocales = {
    'ar': ar,
    'en': en,
  };
}