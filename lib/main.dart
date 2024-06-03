import 'package:challenge_application/application/application.dart';
import 'package:challenge_application/core/services/shared_service/internal_storage_service_implement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'infrastructure/environments.dart';
import 'infrastructure/ioc_m.dart';

void main() async {
  Environments.init(Flavor.dev);
  IocManager.register();

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  InternalStorageServiceImplement storageLocal =
      InternalStorageServiceImplement();
  await storageLocal.init();

  runApp(const Application());
}
