import 'dart:convert';
import 'dart:io';
import 'package:collection/collection.dart';
import 'package:thrifthing_app_kel4/model/user.dart';

class UserManager {
  static final String _usersFileName = 'users.json';

  static List<User> _users = [];

  static void loadUsers() {
    try {
      final file = File(_usersFileName);
      if (file.existsSync()) {
        final content = file.readAsStringSync();
        final jsonData = json.decode(content);
        _users = (jsonData as List)
            .map((userJson) => User.fromJson(userJson))
            .toList();
      }
    } catch (e) {
      print('Error loading users: $e');
    }
  }

  static void saveUsers() {
    try {
      final file = File(_usersFileName);
      final jsonData = _users.map((user) => user.toJson()).toList();
      file.writeAsStringSync(json.encode(jsonData));
    } catch (e) {
      print('Error saving users: $e');
    }
  }

  static User? registerUser(User user) {
    if (_getUserByEmail(user.email) == null) {
      _users.add(user);
      saveUsers();
      return user;
    } else {
      return null; // User already exists
    }
  }

  static User? loginUser(User user) {
    final existingUser = _getUserByEmail(user.email);
    return existingUser != null && existingUser.password == user.password
        ? existingUser
        : null;
  }

  static User? _getUserByEmail(String email) {
    return _users.firstWhereOrNull((user) => user.email == email);
  }
}
