// test/lib/tests/unit/detail_screen_test.dart
// Importaciones necesarias para realizar los tests
import 'package:flutter/material.dart'; // Necesario para usar widgets y material design
import 'package:flutter_test/flutter_test.dart'; // Proporciona las herramientas para realizar tests en Flutter
import 'package:json_holder/models/user.dart'; // Importa el modelo User para poder crear instancias de prueba
import 'package:json_holder/screens/detail_screen.dart'; // Importa el screen que se va a testear

void main() {
  // Este es el punto de entrada principal de los tests. Aquí se definen los grupos de tests y tests individuales.
  group('DetailScreen Widget', () {
    // 'group' permite agrupar varios tests bajo un nombre común, en este caso, todos los tests relacionados con DetailScreen.
    testWidgets('debería construir el DetailScreen correctamente', (WidgetTester tester) async {
      // 'testWidgets' se utiliza para definir un test de widgets. Permite interactuar con el widget y simular eventos.
      // Creamos un usuario de prueba
      final user = User(id: 1, name: 'John Doe', email: 'john@example.com', phone: '123456789');
      // Esta línea crea una instancia del modelo User que se usará para pasarla al DetailScreen como dato.
      
      // Construimos el widget DetailScreen con el usuario de prueba
      await tester.pumpWidget(MaterialApp(home: DetailScreen(user: user)));
      // 'pumpWidget' inyecta el widget en el árbol de widgets y lo construye. En este caso, estamos probando DetailScreen y lo envolvemos en un MaterialApp para simular un entorno de app completo.
      
      // Verificamos que se muestre el nombre del usuario en el título del AppBar
      expect(find.text('John Doe'), findsOneWidget);
      // 'expect' compara el resultado de 'find.text' con 'findsOneWidget'. Esto verifica que el texto 'John Doe' se muestra en algún lugar del widget. 'find.text' busca widgets que contienen el texto específico.
      
      // Verificamos que se muestre el correo electrónico y el número de teléfono en el cuerpo del widget
      expect(find.text('Email: john@example.com'), findsOneWidget);
      expect(find.text('Phone: 123456789'), findsOneWidget);
      // Estas líneas hacen lo mismo que la anterior pero verifican la presencia del email y el teléfono del usuario en el widget.
    });
  });
}


// ### ¿Por qué necesito un árbol de widgets?

// En Flutter, los widgets se organizan en un árbol de widgets. Cada widget puede tener widgets hijos, creando así una estructura jerárquica. Esta estructura es crucial para el funcionamiento de las aplicaciones en Flutter porque:

// 1. **Gestión de Estados**: El árbol de widgets ayuda a Flutter a gestionar los estados de los widgets. Cuando el estado de un widget cambia, Flutter sabe exactamente qué parte del árbol necesita ser reconstruida y actualizada en la pantalla, gracias a la posición del widget en el árbol.

// 2. **Renderizado de Widgets**: Flutter renderiza la interfaz de usuario dibujando los widgets según su orden y relación en el árbol. Los widgets padres pueden afectar la presentación y el comportamiento de sus widgets hijos, por lo que es importante tener una estructura de árbol completa para que los widgets se comporten como se espera.

// 3. **Contexto**: Cada widget tiene un objeto de contexto que conoce la ubicación del widget en el árbol. Este contexto es esencial para que los widgets interactúen con el framework y entre sí, como navegar a otra pantalla o cambiar temas.

// Al usar `tester.pumpWidget`, estás iniciando este árbol de widgets con un widget raíz, en este caso, `MaterialApp`, que envuelve tu widget de interés, `DetailScreen`. Esto es necesario porque muchos widgets dependen de un contexto que solo está disponible en un árbol de widgets completo, como los temas, la navegación, y los MediaQuery. Sin este contexto, muchos widgets no se construirían correctamente durante las pruebas.

// ### ¿`find.text` busca en todo el árbol de widgets?

// Sí, `find.text` busca en todo el árbol de widgets generado por `pumpWidget` aquel widget que contenga el texto especificado. Flutter Test proporciona varios `Finder` para localizar widgets dentro del árbol de widgets. `find.text` es uno de ellos y es muy útil para verificar que ciertos textos están presentes en la pantalla como parte de los widgets. Cuando ejecutas `find.text`, el sistema de testing de Flutter recorre el árbol de widgets completo en busca de cualquier instancia de `Text` que contenga el string que especificaste. Esto permite validar si los textos esperados se muestran al usuario, lo cual es una parte crucial de probar la interfaz de usuario de tu aplicación.