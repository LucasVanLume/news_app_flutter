import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/configs/language/translations/en_us_translations.dart';
import 'package:flutter_clean_architecture/core/configs/language/translations/pt_br_translations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsLanguage extends ChangeNotifier {
  late SharedPreferences _prefs;
  Map<String, String> locale = {
    'locale': 'pt_BR',
  };

  AppSettingsLanguage() {
    _startSettings();
  }

  _startSettings() async {
    await _startPreferences();
    await _readLocale();
  }

  Future<void> _startPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  _readLocale() {
    final local = _prefs.getString('local') ?? 'pt_BR';
    locale = {
      'locale': local,
    };
    notifyListeners();
  }

  _setLocale(String local) async {
    await _prefs.setString('local', local);
    await _readLocale();
  }


  Future<void> changeLanguageButton() async {
    final locale = this.locale['locale'] == 'pt_BR' ? 'en_US' : 'pt_BR';

    await _setLocale(locale);
  }


  Map<String, String> readTexts(BuildContext context) {
    final settings = context.watch<AppSettingsLanguage>();
    final loc = settings.locale;

    if (loc['locale'] == 'pt_BR') {
      return ptBrTranslations;
    } else if (loc['locale'] == 'en_US') {
      return enUsTranslations;
    } else {
      throw ArgumentError('Invalid locale: $loc');
    }
  }

}
