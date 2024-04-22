import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf_io;
import './controllers/depenses_controller.dart';

void main() async {
  final app = depensesController();

  // Configuration du serveur Shelf avec notre application
  final handler =
      const shelf.Pipeline().addMiddleware(shelf.logRequests()).addHandler(app);

  // Démarrage du serveur sur le port 8080
  final server = await shelf_io.serve(handler, 'localhost', 8080);
  print('Serveur démarré sur le port ${server.port}');
}
