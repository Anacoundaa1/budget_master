import 'dart:convert';
import 'package:shelf/shelf.dart' as shelf;
import 'package:supabase/supabase.dart';

Future<shelf.Response> handleDepensesRequest(shelf.Request request) async {
  if (request.method == 'POST' && request.url.path == '/depenses') {
    // Parse request body
    var requestBody = await request.readAsString();
    var requestData = jsonDecode(requestBody);

    // Extract string parameter
    String param = requestData['param'];

    // Connect to Supabase
    var supabase = SupabaseClient('your_supabase_url', 'your_supabase_key');

    // Example: Insert data into Supabase table
    var response = await supabase
        .from('your_table_name')
        .insert({'your_column_name': param});

    if (response.error != null) {
      // If there's an error with the Supabase request
      return shelf.Response.internalServerError(
          body: jsonEncode({'error': response.error?.message}));
    } else {
      // If the Supabase request is successful
      return shelf.Response.ok('Saved: $param');
    }
  } else {
    // For other requests, respond with a 404 Not Found
    return shelf.Response.notFound('Not Found');
  }
}
