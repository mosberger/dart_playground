import 'package:http/http.dart' as http;
import '../todo.dart';

class ValidationBehavior {
  Future<bool> call(
    String authorizationData,
    List<AuthScope> requiredScope,
  ) async {
    final response = await http.get(
      'https://www.googleapis.com/oauth2/v3/userinfo',
      headers: {'Authorization': 'Bearer $authorizationData'},
    );

    return response.statusCode == 200;
  }
}
