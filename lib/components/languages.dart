import 'package:flutter_svg/flutter_svg.dart';

class Language {
  final int id;
  final String name;
  final SvgPicture flag;
  final String languageCode;

  Language(
    this.id,
    this.name,
    this.flag,
    this.languageCode,
  );

  static List<Language> languageList() {
    return <Language>[
      Language(
        1,
        'English (USA)',
        SvgPicture.asset('assets/icons/en.svg'),
        'en',
      ),
    ];
  }
}
