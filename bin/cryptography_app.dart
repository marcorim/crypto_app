

import 'package:cryptography_app/model/crypto_models.dart';

void main(List<String> arguments) {
  Crypto crypto = CryptoViginere();

  encode(crypto);
  print(crypto.value);

  decode(crypto);
  print(crypto.value);
}

void encode(Crypto crypto) {
  crypto.encode('NATALIAM');
}

void decode(Crypto crypto) {
  crypto.decode();
}

