import 'package:ejercico/user.dart';
import 'package:ejercico/api_service.dart';

void main() async {
  try {
    List<User> users = await fetchUsers();

    // Mostrar usuarios filtrados
    List<User> filteredUsers = filterUsersByUsernameLength(users);
    print('Usuarios con username de más de 6 caracteres:');
    for (var user in filteredUsers) {
      print('${user.username}');
    }

    // Contar usuarios con email en dominio 'biz'
    int bizEmailCount = countUsersWithBizEmail(users);
    print('\nNúmero de usuarios con email en el dominio ".biz": $bizEmailCount');
  } catch (e) {
    print('Error: $e');
  }
}
