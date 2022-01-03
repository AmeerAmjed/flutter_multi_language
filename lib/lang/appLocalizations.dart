import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/lang/appLocalizationsDelegate.dart';

class AppLocalizations {
  late Locale locale;
  late Map<String, String> _valueText;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  Future loadTranslateFile() async {
    String _langFile =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');

    Map<String, dynamic> _json = jsonDecode(_langFile);
    _valueText = _json.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslate(String key) {
    return _valueText[key]!;
  }
}
