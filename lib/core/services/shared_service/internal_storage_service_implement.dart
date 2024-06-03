import 'internal_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InternalStorageServiceImplement implements InternalStorageService {
  static final InternalStorageServiceImplement _instance =
      InternalStorageServiceImplement._internal();
  late SharedPreferences _preferences;

  factory InternalStorageServiceImplement() {
    return _instance;
  }

  InternalStorageServiceImplement._internal();

  @override
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> saveString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  @override
  String? getString(String key) {
    return _preferences.getString(key);
  }

  @override
  Future<void> saveInt(String key, int value) async {
    await _preferences.setInt(key, value);
  }

  @override
  int? getInt(String key) {
    return _preferences.getInt(key);
  }

  @override
  Future<void> saveBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  @override
  bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  @override
  Future<void> saveDouble(String key, double value) async {
    await _preferences.setDouble(key, value);
  }

  @override
  double? getDouble(String key) {
    return _preferences.getDouble(key);
  }

  @override
  Future<void> remove(String key) async {
    await _preferences.remove(key);
  }
}
