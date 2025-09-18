import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  final SharedPreferences _prefs ;

  UserPrefs(this._prefs);

  Future<void> saveUser({
     String? firstName,
     String? lastName,
    required String email,
    required String token,
    String? image,
    String? phone,
    String? birthdate,
  }) async {
    await _prefs.setString('firstname', firstName ?? '');
    await _prefs.setString('lastname', lastName ?? '');
    await _prefs.setString('email', email);
    await _prefs.setString('token', token);
    await _prefs.setString('image', image ?? '');
await _prefs.setString('phone', phone ?? '');
await _prefs.setString('birthdate', birthdate ?? '');
  }

  Map<String, String?> getUser() {
    return {
      'firstName': _prefs.getString('firstname'),
      'lastName': _prefs.getString('lastname'),
      'email': _prefs.getString('email'),
      'token': _prefs.getString('token'),
     'image': _prefs.getString('image') ?? '',
'phone': _prefs.getString('phone') ?? '',
'birthdate': _prefs.getString('birthdate') ?? '',

    };
  }

  Future<void> clearUser() async {
    await _prefs.remove('firstname');
    await _prefs.remove('lastname');
    await _prefs.remove('email');
    await _prefs.remove('token');
    await _prefs.remove('image');
    await _prefs.remove('phone');
    await _prefs.remove('birthdate');
  }
}
