import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:supabase/supabase.dart';

Router authController() {
  final supabase = SupabaseClient("https://qyumbpvxzfgwosfhdzxg.supabase.co",
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF5dW1icHZ4emZnd29zZmhkenhnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM0NDQ5NTksImV4cCI6MjAyOTAyMDk1OX0.rS1z3nt3Qb5cuZsbW2el6d6VvnQG_GD7-oC6eoawmeo");
  final app = Router();

  // Route pour l'enregistrement d'un utilisateur
  app.post('/register', (Request request) async {
    try {
      final requestBody = await request.readAsString();
      final Map<String, dynamic> jsonData = json.decode(requestBody);

      final response = await supabase.auth.signUp(
        email: jsonData['email'],
        password: jsonData['password'],
        emailRedirectTo: 'com.supabase.myapp://callback',
      );
    } catch (e) {
      print('Erreur lors de l\'enregistrement de l\'utilisateur : $e');
      // Retourner une réponse d'erreur si nécessaire
      return Response.internalServerError(
          body: 'Erreur lors de l\'enregistrement de l\'utilisateur');
    }
  });

  // Route pour la connexion d'un utilisateur
  app.post('/login', (Request request) async {
    try {
      final requestBody = await request.readAsString();
      final Map<String, dynamic> jsonData = json.decode(requestBody);

      final AuthResponse? res = await supabase.auth.signInWithPassword(
        email: jsonData['email'],
        password: jsonData['password'],
      );

      if (res == null) {
        // Gérer le cas où la réponse est null (éventuellement une erreur de connexion)
        return Response.internalServerError(
            body: 'Erreur lors de la connexion de l\'utilisateur');
      }

      final Session? session = res.session;

      // Stocker les informations de session dans le contexte de la requête
      final updatedRequest = request.change(context: {
        ...request.context,
        'session': session,
      });

      // Retourner une réponse réussie avec la mise à jour du contexte
      return Response.ok(
        json.encode({'message': 'Connexion réussie'}),
        context: updatedRequest.context,
      );
    } catch (e) {
      // Gérer les autres erreurs potentielles
      print('Erreur lors de la connexion de l\'utilisateur : $e');
      return Response.internalServerError(
          body: 'Erreur lors de la connexion de l\'utilisateur');
    }
  });

  return app;
}
