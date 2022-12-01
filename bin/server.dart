import 'package:cryptography_app/controller/crypto_controller.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

void main() async {
 final _router = Router();
 final _crypto = CryptoController();

_router.get('/', _echoRequest);
 _router.get('/encode/<value>', _crypto.encodeValue);

  var handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(_router);

  var server = await shelf_io.serve(handler, 'localhost', 8080);

  // Enable content compression
  server.autoCompress = true;

  print('Serving at http://${server.address.host}:${server.port}');
}

Response _echoRequest(Request request) =>
    Response.ok('Bem vindo - Request for "${request.url}"');