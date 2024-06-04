import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:revnotes_flutter_pb/config/authstatenotfier.dart';
import 'package:revnotes_flutter_pb/pages/home_page.dart';
import 'package:revnotes_flutter_pb/pages/landing_page.dart';
import 'package:revnotes_flutter_pb/pages/login_page.dart';
import 'package:revnotes_flutter_pb/pages/register_page.dart';
import 'package:revnotes_flutter_pb/services/pocketbase_service.dart';

final pbAuthStoreListenable = AuthStateNotifier();

// GoRouter configuration
final _router = GoRouter(
  redirect: (BuildContext context, GoRouterState state) {
    var fullPath = state.fullPath;

    print("Full Path $fullPath");

    if (fullPath == null) {
      return '/';
    }

    if (fullPath == '/login' && PocketBaseService.instance.authStore.isValid) {
      return '/secure/home';
    }

    if (fullPath.startsWith("/secure") &&
        !PocketBaseService.instance.authStore.isValid) {
      return '/';
    }

    // if (state.fullPath?.startsWith("/secure") ??
    //     true && !PocketBaseService.instance.authStore.isValid) {
    //   return '/';
    // }

    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/secure/home',
      builder: (context, state) => const HomePage(),
    ),
  ],
  refreshListenable: pbAuthStoreListenable,
);

GoRouter get router => _router;
