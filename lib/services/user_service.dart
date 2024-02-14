// lib/services/user_service.dart
// Importaciones necesarias para el servicio.
import 'package:http/http.dart' as http; // Importa el paquete 'http' para realizar peticiones HTTP.
import 'dart:convert'; // Proporciona herramientas para decodificar y codificar JSON.
import 'package:json_holder/models/user.dart'; // Importa el modelo User para poder crear instancias a partir de los datos JSON recibidos.
  
// Definición de la clase UserService.
class UserService {
  // Constante privada que almacena la URL base de la API de usuarios.
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/users';

  // Método estático que recupera una lista de usuarios desde una API web.
  static Future<List<User>> getUsers(http.Client client) async {
    // Realiza una petición GET a la URL de la API y espera por la respuesta.
    final response = await client.get(Uri.parse(_baseUrl));
    // 'client.get' realiza la petición HTTP. 'Uri.parse(_baseUrl)' convierte la URL en un objeto Uri.

    // Verifica si el estado de la respuesta HTTP es 200 (OK).
    if (response.statusCode == 200) {
      // Decodifica el cuerpo de la respuesta, que se espera que sea un JSON, en una lista dinámica.
      final List<dynamic> userJson = json.decode(response.body);
      // 'json.decode' convierte la cadena de texto JSON en una lista de mapas dinámicos.

      // Convierte cada elemento de la lista JSON en un objeto User y devuelve la lista de usuarios.
      return userJson.map((json) => User.fromJson(json)).toList();
      // 'map' convierte cada elemento (cada mapa JSON) en un objeto User utilizando 'User.fromJson'.
      // 'toList' convierte el resultado iterable de 'map' en una lista.
    } else {
      // Si el estado de la respuesta no es 200, lanza una excepción.
      throw Exception('Failed to load users');
      // Esto indica que la petición no fue exitosa y la aplicación debe manejar esta excepción.
    }
  }
}


// UserService es esencialmente una clase que encapsula la lógica necesaria para comunicarse con una API externa, en este caso, para obtener una lista de usuarios. Utiliza el paquete http para realizar la petición HTTP y luego decodifica la respuesta JSON para convertirla en una lista de objetos User.

// Este servicio es un componente crucial en aplicaciones que dependen de datos externos, ya que proporciona una manera estructurada y reutilizable de acceder a estos datos. Al separar la lógica de las peticiones HTTP en una clase de servicio, se facilita el mantenimiento del código y se promueve la separación de responsabilidades dentro de la aplicación.