class NicknameGenerator {
  static final _first = ['Gluay', 'Buta'];
  static final _second = [
    'Fat',
    'KaPokLok',
    'KukKuk',
    'LnwZa007',
    'Naruk',
    'AewAew',
    'SoCute'
  ];

  static String get generate {
    _first.shuffle();
    _second.shuffle();
    return _first.first + ' ' + _second.first;
  }
}
