import 'package:challenge_application/core/services/internet_status_check_service/internet_status_check_service.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker _connectionChecker =
      InternetConnectionChecker();

  @override
  Future<bool> isConnected() async {
    InternetConnectionStatus instance =
        await _connectionChecker.connectionStatus;
    return instance.name == "connected" ? true : false;
  }

  @override
  Future<List<AddressCheckOptions>> addressCheckOptions() async {
    return _connectionChecker.addresses;
  }

  @override
  Future<bool> connectionStatus() async {
    InternetConnectionStatus instance =
        await _connectionChecker.connectionStatus;
    return instance.name == "connected" ? true : false;
  }
}
