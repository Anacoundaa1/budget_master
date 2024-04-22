import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

Router depensesController() {
  final app = Router();

  // Route pour ajouter une dépense
  app.post('/addExpense', (Request request) async {
    // Lecture des données JSON du corps de la requête
    final requestBody = await request.readAsString();
    final Map<String, dynamic> jsonData = json.decode(requestBody);

    // Extraction des paramètres de la requête
    final String expenseName = jsonData['name'];
    final String expenseCategory = jsonData['category'];
    final String expenseAmount = jsonData['amount'];

    // Exemple de traitement : enregistrement de la dépense dans une base de données ou un fichier
    // Pour l'instant, affichons simplement les données reçues
    print('Nouvelle dépense ajoutée :');
    print(
        'Nom: $expenseName, Catégorie: $expenseCategory, Montant: $expenseAmount');

    // Réponse de succès
    return Response.ok('Dépense ajoutée avec succès');
  });

  return app;
}
