import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class NavigatorGoRouteApp {
  static CustomTransitionPage buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }

  static void navigatorPushReplacementNamed(
      {required BuildContext context,
      String? nameRoute,
      Map<String, dynamic>? argument}) {
    context.pushReplacementNamed(
      nameRoute!,
      extra: argument,
    );
  }

  static navigatorPushNamed({
    BuildContext? context,
    String? nameRoute,
    Object? argument,
    VoidCallback? themFuction,
  }) {
    context!
        .pushNamed(
          nameRoute!,
          extra: argument,
        )
        .then((value) async => themFuction);
  }

  static navigatorPop({
    BuildContext? context,
  }) {
    context!.pop();
  }

  static navigatorReplaceNamed(
      {BuildContext? context,
      String? nameRoute,
      Map<String, dynamic>? argument}) {
    context!.replaceNamed(nameRoute!, extra: argument);
  }

  static navigatorArguments(
      {BuildContext? context,
      String? nameRoute,
      Map<String, dynamic>? argument}) {
    context!.go(
      Uri(
        path: nameRoute,
        queryParameters: argument,
      ).toString(),
    );
  }
}
