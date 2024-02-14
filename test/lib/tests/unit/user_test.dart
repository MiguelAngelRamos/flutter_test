// test/lib/tests/unit/user_test.dart
// Importaciones necesarias para realizar los tests
import 'package:json_holder/models/user.dart'; // Importa el modelo User para poder probarlo
import 'package:flutter_test/flutter_test.dart'; // Proporciona las herramientas para realizar tests en Flutter

void main() {
  // Este es el punto de entrada principal de los tests. Aquí se definen los grupos de tests y tests individuales.
  group('User Model', () {
    // 'group' permite agrupar varios tests bajo un nombre común, en este caso, todos los tests relacionados con el modelo User.
    test('fromJson debe convertir correctamente un mapa JSON en un objeto User', () {
      // 'test' se utiliza para definir un test unitario. Este test verificará una funcionalidad específica del modelo User.
      // Crea una instancia del modelo User usando un mapa JSON de prueba
      final user = User.fromJson({
        'id': 1,
        'name': 'John Doe',
        'email': 'john@example.com',
        'phone': '123456789',
      });
      // Esta línea demuestra cómo convertir un mapa JSON en una instancia de User. Esto es importante para probar que la función `fromJson` del modelo User funciona correctamente.
      
      // Verifica que el ID del usuario es el esperado
      expect(user.id, 1);
      // 'expect' compara el valor de 'user.id' con el valor esperado (1). Esto verifica que el campo 'id' se haya mapeado correctamente desde el JSON.

      // Verifica que el nombre del usuario es el esperado
      expect(user.name, 'John Doe');
      // Similar a la verificación anterior, esto asegura que el campo 'name' se haya mapeado correctamente desde el JSON.

      // Verifica que el correo electrónico del usuario es el esperado
      expect(user.email, 'john@example.com');
      // Verifica que el campo 'email' se haya mapeado correctamente desde el JSON.

      // Verifica que el teléfono del usuario es el esperado
      expect(user.phone, '123456789');
      // Finalmente, verifica que el campo 'phone' se haya mapeado correctamente desde el JSON.
    });
  });
}
