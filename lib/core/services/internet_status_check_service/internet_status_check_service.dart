import 'dart:async';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
  Future<List<AddressCheckOptions>> addressCheckOptions();
  Future<bool> connectionStatus();
}
