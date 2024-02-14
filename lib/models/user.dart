// lib/models/user.dart
// Definición de la clase User
class User {
  // Declaración de variables finales para los atributos del usuario.
  final int id;
  final String name, email, phone;

  /* Las variables id, name, email y phone se declaran como final para indicar que una vez que se asigna un valor a cada una de ellas en el constructor, ese valor no puede cambiar durante el ciclo de vida de la instancia de la clase User. */

  // Constructor de la clase User que requiere todos los campos como parámetros.
  User({required this.id, required this.name, required this.email, required this.phone});
  // Este constructor inicializa la instancia de User con los valores proporcionados para id, name, email, y phone.
  // La palabra clave 'required' indica que cada parámetro es obligatorio.

  // Factory constructor que crea una instancia de User desde un mapa JSON.
  factory User.fromJson(Map<String, dynamic> json) {
    // El constructor toma un mapa JSON como entrada y extrae los valores correspondientes a cada campo.
    return User(
      // Crea una nueva instancia de User utilizando los valores extraídos del mapa JSON.
      id: json['id'], // Extrae el valor del campo 'id' del mapa JSON y lo asigna al campo id del usuario.
      name: json['name'], // Extrae el valor del campo 'name' del mapa JSON y lo asigna al campo name del usuario.
      email: json['email'], // Extrae el valor del campo 'email' del mapa JSON y lo asigna al campo email del usuario.
      phone: json['phone'], // Extrae el valor del campo 'phone' del mapa JSON y lo asigna al campo phone del usuario.
    );
  }
}


// Este modelo User es un ejemplo típico de cómo definir una clase en Dart con propiedades inmutables (usando final) y cómo construir instancias de esa clase a partir de datos en formato JSON. Esto es especialmente útil en aplicaciones Flutter que consumen APIs web, permitiendo una conversión directa de la respuesta JSON en objetos Dart para un manejo más sencillo dentro de la aplicación.

// El uso de un constructor factory es una práctica común para implementar patrones de inicialización complejos, como la creación de una instancia a partir de un mapa JSON, lo cual es frecuente al trabajar con APIs que devuelven datos en este formato. Esto facilita la deserialización de datos JSON y la instanciación de objetos en Dart de manera directa y legible.