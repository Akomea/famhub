import 'package:get/get.dart';

///Creates a class which map keys to values which can be translated depending on locale
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_UK': {
      'profile': 'Profile',
    },
    'ja_JP': {
      'profile': 'プロフィール',
    }
  };
}