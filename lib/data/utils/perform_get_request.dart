import 'dart:convert';

import 'package:http/http.dart' as client;
import 'package:pokedex_app/core/const/app_constants.dart';
import 'package:pokedex_app/core/errors/exceptions.dart';

//Pre-request para las apis correspondientes
Future<dynamic> performGetRequest({required String endpoint}) async {
  try {
    final url = Uri.parse('${AppConstants.baseUrl}$endpoint');
    final response = await client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 404) {
      throw const ServerException(message: 'Pokémon no encontrado');
    } else {
      throw const ServerException(
        message: 'Error en el servidor: por favor reintente nuevamente',
      );
    }
  } catch (e) {
    if (e is ServerException) rethrow;
    throw const NetworkException(
      message: 'Error de conexión: por favor reintente nuevamente',
    );
  }
}
