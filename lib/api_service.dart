import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

// Filtrar usuarios cuyo username tenga más de 6 caracteres
List<User> filterUsersByUsernameLength(List<User> users) {
  return users.where((user) => user.username.length > 6).toList();
}

// Contar usuarios cuyo email pertenece al dominio 'biz'
int countUsersWithBizEmail(List<User> users) {
  return users.where((user) => user.email.endsWith('.biz')).length;
}
