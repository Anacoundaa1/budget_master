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

  // Création d'un middleware pour gérer les en-têtes CORS
  final corsMiddleware =
      shelf.createMiddleware(requestHandler: (shelf.Request request) {
    // Ajout des en-têtes CORS à chaque requête
    if (request.method == 'OPTIONS') {
      // Répondre directement aux requêtes OPTIONS pour les requêtes pré-vérification CORS
      return shelf.Response.ok(null, headers: _corsHeaders);
    }
    // Pour toutes les autres requêtes, passer au gestionnaire suivant
    return null;
  });

  // Ajout du middleware CORS au handler
  final handler = shelf.Pipeline()
      .addMiddleware(corsMiddleware) // Middleware pour les en-têtes CORS
      .addMiddleware(shelf.logRequests())
      .addHandler(app);

  // Démarrage du serveur sur le port 8080
  final server = await io.serve(handler, 'localhost', 8080);

  // Affichage d'un message pour indiquer que le serveur est démarré
  print('Serveur démarré sur le port ${server.port}');
}

// En-têtes CORS
final Map<String, String> _corsHeaders = {
  'Access-Control-Allow-Origin':
      '*', // Autoriser l'accès à partir de toutes les sources
  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS', // Méthodes autorisées
  'Access-Control-Allow-Headers':
      'Origin, Content-Type, Accept', // En-têtes autorisés
  'Access-Control-Max-Age':
      '86400', // Durée maximale de pré-caching des réponses (en secondes)
};
