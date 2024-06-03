import 'package:challenge_application/features/home_module/home_modulte.dart';
import '../abstractions/injector.dart';
import '../infrastructure/environments.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      routerConfig: _generateRoutes(),
    );
  }

  _generateRoutes() {
    return GoRouter(
      observers: [],
      initialLocation: HomeModule.homePage,
      routes: [
        ...HomeModule.generateRoutes(),
      ],
    );
  }

  static void registerDependencies(Injector injector) {
    injector.registerFactoryByName(
      () => Environments.baseUrl,
      "baseUrl",
    );
  }
}
