import 'package:shared_preferences/shared_preferences.dart';
import 'package:using_sharedpreferences/model/usercrediential_model.dart';

class LocalStorage {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> createUser(UserCredentialModel user) async {
    final prefs = await _prefs;
    await prefs.setString('Username', user.username);
    await prefs.setString('Password', user.password);
  }

  Future<UserCredentialModel?> getUser() async {
    final prefs = await _prefs;
    final storedUsername = prefs.getString('Username');
    final storedPassword = prefs.getString('Password');
    if (storedUsername != null && storedPassword != null) {
      return UserCredentialModel(
        username: storedUsername,
        password: storedPassword,
      );
    }
    return null;
  }
}
