// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../../auth/presentation/sign_in_page.dart' as _i2;
import '../../../splash/presentation/splash_page_.dart' as _i1;
import '../../../starred_repos/presentation/starred_repos_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    SignInRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    StarredReposRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.StarredReposPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashRoute.name, path: '/'),
        _i4.RouteConfig(SignInRoute.name, path: '/sign-in'),
        _i4.RouteConfig(StarredReposRoute.name, path: 'starred')
      ];
}

/// generated route for [_i1.SplashPage]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for [_i2.SignInPage]
class SignInRoute extends _i4.PageRouteInfo<void> {
  const SignInRoute() : super(name, path: '/sign-in');

  static const String name = 'SignInRoute';
}

/// generated route for [_i3.StarredReposPage]
class StarredReposRoute extends _i4.PageRouteInfo<void> {
  const StarredReposRoute() : super(name, path: 'starred');

  static const String name = 'StarredReposRoute';
}
