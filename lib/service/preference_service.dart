import 'package:shared_preferences/shared_preferences.dart';


class PreferencesService {
  PreferencesService._internal();

  factory PreferencesService() => _instance;

  static final PreferencesService _instance = PreferencesService._internal();

  static const auth_token = "auth_token";

  Future<SharedPreferences> _getInstance() async {
    return SharedPreferences.getInstance();
  }

  String getToken() {
    return 'test_token';
  }

  setAuthToken(String token) async {
    (await _getInstance()).setString(PreferencesService.auth_token, token);
  }

  Future<String?> getAuthToken() async {
    return (await _getInstance()).getString(PreferencesService.auth_token);
  }
}