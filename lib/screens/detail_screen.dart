//screens/detail_screen.dart
// Importaciones necesarias para el archivo.
import 'package:flutter/material.dart'; // Importa el paquete Material Design de Flutter, que proporciona una amplia gama de widgets predefinidos y estilos para la construcción de la UI.
import 'package:json_holder/models/user.dart'; // Importa la definición de la clase User desde el directorio de modelos.

// Definición de la clase DetailScreen, que extiende StatelessWidget.
class DetailScreen extends StatelessWidget {
  // Campo final para almacenar la instancia de User pasada a DetailScreen.
  final User user;

  // Constructor de DetailScreen que acepta un objeto User como parámetro.
  const DetailScreen({super.key, required this.user});
  // 'super.key' pasa el parámetro key al constructor de la clase base (StatelessWidget).
  // 'required this.user' asegura que se debe pasar un objeto User al crear una instancia de DetailScreen.

  @override
  Widget build(BuildContext context) {
    // Método build que describe la parte de la UI que el widget representa.
    return Scaffold(
      // Scaffold proporciona la estructura básica de visualización de la aplicación, incluyendo AppBar, Body, FloatingActionButton, etc.
      appBar: AppBar(
        // AppBar muestra una barra de aplicaciones en la parte superior.
        title: Text(user.name),
        // El título de AppBar se establece con el nombre del usuario.
      ),
      body: Padding(
        // Padding agrega relleno alrededor de su hijo.
        padding: const EdgeInsets.all(16.0),
        // Se especifica un relleno uniforme de 16.0 píxeles por todos lados.
        child: Column(
          // Column permite organizar sus hijos en una columna vertical.
          crossAxisAlignment: CrossAxisAlignment.start,
          // Los hijos se alinean al inicio del eje transversal (izquierda).
          children: [
            // Lista de widgets hijos de Column.
            Text('Email: ${user.email}'),
            // Muestra el correo electrónico del usuario.
            Text('Phone: ${user.phone}'),
            // Muestra el teléfono del usuario.
          ],
        ),
      ),
    );
  }
}


// DetailScreen es un widget que muestra la información detallada de un usuario, como su nombre, correo electrónico y teléfono. Este tipo de pantalla es común en aplicaciones que requieren mostrar información más detallada sobre un elemento seleccionado, en este caso, un usuario.

// La estructura de DetailScreen utiliza widgets fundamentales de Flutter como Scaffold para proporcionar la estructura básica de la página, AppBar para la barra superior, y Column para organizar el contenido en un formato vertical. La combinación de estos elementos crea una interfaz de usuario coherente y funcional que es fácil de leer y navegar para el usuario final.