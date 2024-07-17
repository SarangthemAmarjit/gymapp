// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:gymwebapp/pages/dashboards/dashboard.dart' as _i1;
import 'package:gymwebapp/pages/view/web/applicationform.dart' as _i2;
import 'package:gymwebapp/pages/view/web/loginpage.dart' as _i5;
import 'package:gymwebapp/pages/view/web/paymentpages/payment.dart' as _i3;
import 'package:gymwebapp/screenhandler.dart' as _i4;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardRouteArgs>(
          orElse: () => const DashboardRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DashboardScreen(
          key: args.key,
          uid: args.uid,
        ),
      );
    },
    GymFormPage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.GymFormPage(),
      );
    },
    PaymentPage.name: (routeData) {
      final args = routeData.argsAs<PaymentPageArgs>(
          orElse: () => const PaymentPageArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.PaymentPage(
          key: args.key,
          args: args.args,
        ),
      );
    },
    RouteHandlerPage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ScreenHandlerPage(),
      );
    },
    WebLoginPage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.WebLoginPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardScreen]
class DashboardRoute extends _i6.PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    _i7.Key? key,
    String? uid,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          DashboardRoute.name,
          args: DashboardRouteArgs(
            key: key,
            uid: uid,
          ),
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i6.PageInfo<DashboardRouteArgs> page =
      _i6.PageInfo<DashboardRouteArgs>(name);
}

class DashboardRouteArgs {
  const DashboardRouteArgs({
    this.key,
    this.uid,
  });

  final _i7.Key? key;

  final String? uid;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key, uid: $uid}';
  }
}

/// generated route for
/// [_i2.GymFormPage]
class GymFormPage extends _i6.PageRouteInfo<void> {
  const GymFormPage({List<_i6.PageRouteInfo>? children})
      : super(
          GymFormPage.name,
          initialChildren: children,
        );

  static const String name = 'GymFormPage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PaymentPage]
class PaymentPage extends _i6.PageRouteInfo<PaymentPageArgs> {
  PaymentPage({
    _i7.Key? key,
    String? args,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          PaymentPage.name,
          args: PaymentPageArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentPage';

  static const _i6.PageInfo<PaymentPageArgs> page =
      _i6.PageInfo<PaymentPageArgs>(name);
}

class PaymentPageArgs {
  const PaymentPageArgs({
    this.key,
    this.args,
  });

  final _i7.Key? key;

  final String? args;

  @override
  String toString() {
    return 'PaymentPageArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [_i4.ScreenHandlerPage]
class RouteHandlerPage extends _i6.PageRouteInfo<void> {
  const RouteHandlerPage({List<_i6.PageRouteInfo>? children})
      : super(
          RouteHandlerPage.name,
          initialChildren: children,
        );

  static const String name = 'RouteHandlerPage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.WebLoginPage]
class WebLoginPage extends _i6.PageRouteInfo<void> {
  const WebLoginPage({List<_i6.PageRouteInfo>? children})
      : super(
          WebLoginPage.name,
          initialChildren: children,
        );

  static const String name = 'WebLoginPage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
