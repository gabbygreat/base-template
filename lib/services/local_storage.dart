import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  // Singleton instance to provide a global point of access to the LocalStorage object.
  static final LocalStorage instance = LocalStorage._init();

  // Private constructor to restrict instance creation. Used as part of the singleton pattern.
  LocalStorage._init();

  // SharedPreferences instance for non-secure storage operations.
  late SharedPreferences _prefs;

  // FlutterSecureStorage instance for secure storage operations.
  late FlutterSecureStorage _storage;

  // Initializes the SharedPreferences and FlutterSecureStorage instances.
  // This method should be called before accessing other methods of this class.
  Future<void> initialise() async {
    _storage = const FlutterSecureStorage();
    _prefs = await SharedPreferences.getInstance();
  }

  // Getter for the SharedPreferences instance, allowing access to non-secure storage.
  SharedPreferences get prefs {
    return _prefs;
  }

  // Getter for the FlutterSecureStorage instance, allowing access to secure storage.
  FlutterSecureStorage get storage {
    return _storage;
  }

  // Keys used for storing and retrieving specific items in the storage.
  final String _token = 'token';
  final String _email = 'email';
  final String _loggedIn = 'loggedIn';
  final String _firstTime = 'firstTime';

  // Securely saves the user's email in FlutterSecureStorage.
  Future<void> saveEmail(String value) async {
    await storage.write(key: _email, value: value);
  }

  // Retrieves the user's email from FlutterSecureStorage.
  Future<String> getEmail() async {
    String email = (await storage.read(key: _email))!;
    return email;
  }

  // Securely saves a token in FlutterSecureStorage.
  Future<void> saveToken(String value) async {
    await storage.write(key: _token, value: value);
  }

  // Retrieves the stored token from FlutterSecureStorage.
  Future<String?> getToken() async {
    String token = (await storage.read(key: _token))!;
    return token;
  }

  // Sets the first-time launch flag in SharedPreferences to false.
  Future<bool> setFirstTime() async {
    return await prefs.setBool(_firstTime, false);
  }

  // Retrieves the first-time launch flag from SharedPreferences.
  bool getFirstTime() {
    return prefs.getBool(_firstTime) ?? true;
  }

  // Sets the user's logged-in status in SharedPreferences.
  Future<bool> setLoggedIn({required bool value}) async {
    return await prefs.setBool(_loggedIn, value);
  }

  // Retrieves the user's logged-in status from SharedPreferences.
  bool getLoggedIn() {
    return prefs.getBool(_loggedIn) ?? false;
  }
}
