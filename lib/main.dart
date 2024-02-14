//lib/main.dart
// Importaciones necesarias para la aplicación.
import 'package:flutter/material.dart'; // Importa el framework de Flutter para construir la UI.
import 'package:http/http.dart' as http; // Usado para realizar peticiones HTTP.
import 'services/user_service.dart'; // Servicio para obtener los datos de los usuarios.
import 'models/user.dart'; // Modelo de datos User.
import 'screens/detail_screen.dart'; // Pantalla de detalle para mostrar información del usuario.

// Función principal que ejecuta la aplicación.
void main() {
  runApp(const MyApp());
}

// Widget principal de la aplicación.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Deshabilita el banner de modo debug.
      title: 'Flutter Demo', // Título de la aplicación.
      home: UserListScreen(), // Pantalla inicial que muestra la lista de usuarios.
    );
  }
}

// Widget que muestra la lista de usuarios.
class UserListScreen extends StatefulWidget {
  // Constructor de la clase UserListScreen.
  // Recibe una clave opcional (key) que se pasa al constructor de la clase base (StatefulWidget).
  const UserListScreen({super.key});

  @override
  // Método override de 'createState' que define cómo se crea el estado para este StatefulWidget.
  // Este método es un requisito para todos los StatefulWidget y debe devolver una nueva instancia
  // del estado que se asociará con este widget.
  UserListScreenState createState() => UserListScreenState();
  // Aquí, retorna una instancia de UserListScreenState, que es donde se manejará el estado
  // del widget UserListScreen. Esta separación entre el widget y su estado permite a Flutter
  // reconstruir los widgets en la interfaz de usuario de manera eficiente.
}

// Estado del widget UserListScreen.
class UserListScreenState extends State<UserListScreen> {
  late Future<List<User>> futureUsers; // Futuro para la carga de los usuarios.

  @override
  void initState() {
    super.initState();
    futureUsers = _fetchUsers(); // Inicializa la carga de los usuarios.
  }

  // Función para obtener los usuarios desde el servicio UserService.
  Future<List<User>> _fetchUsers() async {
    final client = http.Client(); // Crea una instancia de http.Client.
    final users = await UserService.getUsers(client); // Obtiene los usuarios utilizando el cliente HTTP.
    client.close(); // Cierra el cliente después de su uso.
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'), // Título de la AppBar.
      ),
      body: FutureBuilder<List<User>>(
        future: futureUsers, // El futuro que se resuelve con la lista de usuarios.
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Muestra un indicador de carga.
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Muestra un mensaje de error.
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length, // Número de usuarios.
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].name), // Muestra el nombre del usuario.
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(user: snapshot.data![index]), // Navega a DetailScreen al tocar.
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
