import 'dart:io';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'controllers/user_controller.dart';
import './controllers/depenses_controller.dart';

void main() async {
  // Création des routeurs (controllers)
  final authRouter = authController();
  final expenseRouter = depensesController();

  // Création d'un routeur principal
  final app = Router();

  // Montage des sous-routeurs sur le routeur principal
  app.mount('/user/', authRouter);
  app.mount('/depenses/',
      expenseRouter); // Utilisation de '/depenses/' au lieu de '/expenses/'

  // Création d'un serveur Shelf
  final handler =
      const shelf.Pipeline().addMiddleware(shelf.logRequests()).addHandler(app);

  // Démarrage du serveur sur le port 8080
  final server = await io.serve(handler, 'localhost', 8080);

  // Affichage d'un message pour indiquer que le serveur est démarré
  print('Serveur démarré sur le port ${server.port}');
}
