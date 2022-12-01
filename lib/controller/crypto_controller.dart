import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cryptography_app/model/crypto_models.dart';
import 'package:shelf/shelf.dart';

class CryptoController {

  CryptoController();

  FutureOr<Response> encodeValue(Request request, String value) async
  {
    Crypto crypto = CryptoViginere();
    crypto.encode(value);

    try {
      return Response(200,
        body: jsonEncode({
          'status': 'ok',
          'value': crypto.value,
          'key': crypto.getKey,  
        }),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }
      );
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({
          'status': 'error',
          'message': e.toString(),
        })
      );
    }
  }
}

