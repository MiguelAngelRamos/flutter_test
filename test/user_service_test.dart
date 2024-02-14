// test/user_service_test.dart
// Importaciones necesarias para realizar los tests
import 'package:flutter_test/flutter_test.dart'; // Proporciona herramientas de testing específicas de Flutter.
import 'package:http/http.dart' as http; // Usado para hacer llamadas HTTP.
import 'package:mockito/mockito.dart'; // Proporciona funcionalidades para crear mocks y espiar en las llamadas a funciones.
import 'package:json_holder/services/user_service.dart'; // El servicio que estás probando, que realiza llamadas HTTP para obtener datos de usuarios.
import 'package:json_holder/models/user.dart'; // El modelo de datos que se espera recibir del servicio.
import 'mocks.mocks.dart'; // Importa los mocks generados por Mockito para usar en los tests.

void main() {
  // Punto de entrada de los tests.
  group('UserService', () {
    // Agrupa varios tests que se realizarán en el servicio UserService.
    
    // Creando un MockClient
    final client = MockClient();
    // Instancia un MockClient. Este objeto simulará las llamadas HTTP realizadas por UserService.

    test('returns a List<User> if the http call completes successfully', () async {
      // Define un test para verificar que UserService devuelve una lista de usuarios cuando la llamada HTTP es exitosa.
      
      // Simula una respuesta exitosa cuando se hace una petición GET
      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/users')))
          .thenAnswer((_) async => http.Response('[{"id": 1, "name": "Test User", "email": "test@example.com", "phone": "123456789"}]', 200));
      // Configura el mock para devolver una respuesta HTTP exitosa cuando se solicitan los usuarios.

      // Realiza la llamada a la función getUsers pasando el cliente mockeado
      final users = await UserService.getUsers(client);
      // Llama al método getUsers de UserService, pasando el mock del cliente HTTP.

      // Verifica que la lista de usuarios no esté vacía y que los datos sean correctos
      expect(users, isA<List<User>>());
      // Asegura que el resultado es una lista de usuarios.
      expect(users.length, 1);
      // Verifica que la lista contiene exactamente un usuario.
      expect(users.first.name, 'Test User');
      // Verifica que el nombre del usuario en la lista es el esperado.
    });

    test('throws an exception if the http call completes with an error', () async {
      // Define un test para verificar que UserService lanza una excepción cuando la llamada HTTP falla.
      
      // Simula una respuesta de error
      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/users')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // Configura el mock para devolver una respuesta HTTP de error.

      // Verifica que se lanza una excepción cuando la llamada HTTP falla
      expect(UserService.getUsers(client), throwsException);
      // Espera que la llamada al método getUsers resulte en una excepción, indicando un fallo en la llamada HTTP.
    });
  });
}
