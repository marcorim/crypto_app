import 'dart:math';

abstract class Crypto {
  late String _key;
  late String _value;
  late String _text;

  String get getKey {
    return _key;
  }

  String get value {
    return _value;
  }

  String _newKey();
  String _encrypt();
  String _decrypt();

  encode(String text) {
    _text = text;
    _value = _encrypt();
  }

  decode() {
    _value = _decrypt();
  }

  Crypto() {
    _key =_newKey();
  }
}

class CryptoViginere implements Crypto {
  static const _length = 8;
  //static const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
  static const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  @override
  late String _key;

  @override
  late String _value;

  @override
  late String _text;

  CryptoViginere() {
    _key =_newKey();
  }

  @override
  String get getKey {
    return _key;
  }

  @override
  String get value {
    return _value;
  }

  @override
  encode(String text) {
    final RegExp regex = RegExp(r"^[a-zA-Z]+$");

    if (text.length != _length) {
      throw 'Value must be eight characters long';
    }

    if (!regex.hasMatch(text)) {
      throw 'You will not be allowed to enter numbers or specials.';
    }

    _text = text;
    _value = _encrypt();
  }

  @override
  decode() {
    _value = _decrypt();
  }

  @override
  String _newKey() {
    Random rnd = Random();
  
    return String.fromCharCodes(
        Iterable.generate(
          _length,
          (_) => chars.codeUnitAt(
            rnd.nextInt(chars.length),
          ),
        ),
      );
  }
  
  @override
 String _decrypt() {
    var charCodeLetterA = "A".codeUnits;
    var result = '';

    for (var i = 0; i < _length; i++) {
      var sum = (_value.codeUnits[i] - _key.codeUnits[i]) + 26 ;
      sum %= 26;
      sum += charCodeLetterA[0];

      result = '$result${String.fromCharCode(sum)}';
    }

    return result;
  }
  
  @override
 String _encrypt() {
    var charCodeLetterA = "A".codeUnits;
    var result = '';

    for (var i = 0; i < _length; i++) {
      var sum = (_key.codeUnits[i] + _text.codeUnits[i]) % 26 ;
      sum += charCodeLetterA[0];

      result = '$result${String.fromCharCode(sum)}';
    }

    return result;
  }
}
