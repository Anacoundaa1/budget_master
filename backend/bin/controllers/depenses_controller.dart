import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:supabase/supabase.dart';

Router depensesController() {
  final app = Router();

  final supabase = SupabaseClient("https://qyumbpvxzfgwosfhdzxg.supabase.co",
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF5dW1icHZ4emZnd29zZmhkenhnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM0NDQ5NTksImV4cCI6MjAyOTAyMDk1OX0.rS1z3nt3Qb5cuZsbW2el6d6VvnQG_GD7-oC6eoawmeo");

  // Route pour ajouter une dépense
  app.post('/depenses', (Request request) async {
    try {
      final requestBody = await request.readAsString();
      final Map<String, dynamic> jsonData = json.decode(requestBody);
      final DateTime date = DateTime.parse(jsonData['date']);
      final String dateString = date.toIso8601String();

      final response = await supabase.from('depenses').insert({
        'intitule': jsonData['intitule'],
        'id_categorie': jsonData['id_categorie'],
        'montant': jsonData['montant'],
        'date': dateString,
      }).select();

      // Ajouter les en-têtes CORS à la réponse
      final headers = {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
        'Access-Control-Allow-Headers': 'Origin, Content-Type',
        'Access-Control-Max-Age': '86400',
      };
      return Response.ok('Dépense ajoutée avec succès', headers: headers);
    } catch (error) {
      // Erreur inattendue
      return Response.internalServerError(
          body:
              'Une erreur inattendue s\'est produite lors de l\'ajout de la dépense');
    }
  });

// Route pour récupérer toutes les dépenses
  app.get('/getDepenses', (Request request) async {
    try {
      final response = await supabase.from('depenses').select();

      final List<dynamic> depenses = response;

      // Ajouter les en-têtes CORS à la réponse
      final headers = {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
        'Access-Control-Allow-Headers': 'Origin, Content-Type',
        'Access-Control-Max-Age': '86400',
      };
      return Response.ok(json.encode(depenses), headers: headers);
    } catch (error) {
      // Erreur inattendue
      return Response.internalServerError(
          body:
              'Une erreur inattendue s\'est produite lors de la récupération des dépenses');
    }
  });

// Route pour récupérer les 6 dernières dépenses
  app.get('/getLastDepenses', (Request request) async {
    try {
      final response = await supabase
          .from('depenses')
          .select()
          .order('date', ascending: false)
          .limit(6);

      final List<dynamic> depenses = response;

      // Ajouter les en-têtes CORS à la réponse
      final headers = {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
        'Access-Control-Allow-Headers': 'Origin, Content-Type',
        'Access-Control-Max-Age': '86400',
      };
      return Response.ok(json.encode(depenses), headers: headers);
    } catch (error) {
      // Erreur inattendue
      return Response.internalServerError(
          body:
              'Une erreur inattendue s\'est produite lors de la récupération des dépenses');
    }
  });

// Route pour récupérer le total des dépenses du mois en cours
  app.get('/totalMoisEnCours', (Request request) async {
    try {
      // Obtention de la date actuelle
      final now = DateTime.now();

      // Début du mois en cours
      final debutMois = DateTime(now.year, now.month, 1);

      // Fin du mois en cours
      final finMois = DateTime(now.year, now.month + 1, 1);

      print(finMois);

      final response = await supabase
          .from('depenses')
          .select('montant')
          .filter('date', 'gt', debutMois.toIso8601String())
          .filter('date', 'lt', finMois.toIso8601String());

      // Calcul du montant total des dépenses
      double total = 0;
      for (final dynamic depense in response) {
        final double montant = double.parse(depense['montant'].toString());
        total += montant;
      }

      // Ajouter les en-têtes CORS à la réponse
      final headers = {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
        'Access-Control-Allow-Headers': 'Origin, Content-Type',
        'Access-Control-Max-Age': '86400',
      };
      return Response.ok(json.encode({'total': total}), headers: headers);
    } catch (error) {
      // Erreur inattendue
      return Response.internalServerError(
          body:
              'Une erreur inattendue s\'est produite lors du calcul du montant total des dépenses du mois en cours');
    }
  });

  return app;
}
