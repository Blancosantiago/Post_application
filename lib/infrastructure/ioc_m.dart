import 'package:challenge_application/abstractions/http_client.dart';
import 'package:challenge_application/abstractions/injector.dart';
import 'package:challenge_application/application/application.dart';
import 'package:challenge_application/core/services/internet_status_check_service/internet_status_check_service.dart';
import 'package:challenge_application/core/services/internet_status_check_service/internet_status_check_service_implement.dart';
import 'package:challenge_application/features/home_module/home_modulte.dart';
import 'package:challenge_application/integrations/dio_client/dio_http_client.dart';
import 'package:challenge_application/integrations/get_it.dart';

abstract class IocManager {
  static Injector? _injector;

  static void register() {
    _injector = Injector.register(GetItInjector());
    registerCommonDependencies(_injector!);
    HomeModule.registerDependencies(_injector!);
    Application.registerDependencies(_injector!);
  }

  static Injector getInstance() => _injector!;
  static void registerCommonDependencies(Injector injector) {
    injector.registerFactory<HttpClient>(() => DioHttpClient());
    injector.registerFactory<NetworkInfo>(() => NetworkInfoImpl());
  }
}
