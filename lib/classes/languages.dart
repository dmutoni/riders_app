class Language {
  final int? id;
  final String? name;
  final String? flag;
  final String? languageCode;

  const Language({
    required this.id,
    required this.name,
    required this.flag,
    required this.languageCode,
  });

  static List<Language> languageList() {
    return <Language>[
      const Language(
        id: 1,
        name: 'Kinyarwanda',
        flag: '🇷🇼',
        languageCode: 'rw',
      ),
      const Language(
        id: 2,
        name: 'English',
        flag: '🇺🇸',
        languageCode: 'en',
      ),
      const Language(
        id: 3,
        name: 'French',
        flag: '🇫🇷',
        languageCode: 'fr',
      ),
    ];
  }
}
