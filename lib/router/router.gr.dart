// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:gymwebapp/pages/dashboards/dashboard.dart' as _i2;
import 'package:gymwebapp/pages/payment/paymentpage.dart' as _i1;
import 'package:gymwebapp/pages/view/web/applicationform.dart' as _i3;
import 'package:gymwebapp/pages/view/web/loginpage.dart' as _i6;
import 'package:gymwebapp/pages/view/web/paymentpages/payment.dart' as _i4;
import 'package:gymwebapp/screenhandler.dart' as _i5;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AtomPaymentPage.name: (routeData) {
      final args = routeData.argsAs<AtomPaymentPageArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AtomPaymentPage(
          args.mode,
          args.payDetails,
          args.responsehashKey,
          args.responseDecryptionKey,
          key: args.key,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardRouteArgs>(
          orElse: () => const DashboardRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DashboardScreen(
          key: args.key,
          uid: args.uid,
        ),
      );
    },
    GymFormPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.GymFormPage(),
      );
    },
    PaymentPage.name: (routeData) {
      final args = routeData.argsAs<PaymentPageArgs>(
          orElse: () => const PaymentPageArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.PaymentPage(
          key: args.key,
          args: args.args,
        ),
      );
    },
    RouteHandlerPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ScreenHandlerPage(),
      );
    },
    WebLoginPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.WebLoginPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AtomPaymentPage]
class AtomPaymentPage extends _i7.PageRouteInfo<AtomPaymentPageArgs> {
  AtomPaymentPage({
    required dynamic mode,
    required dynamic payDetails,
    required dynamic responsehashKey,
    required dynamic responseDecryptionKey,
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          AtomPaymentPage.name,
          args: AtomPaymentPageArgs(
            mode: mode,
            payDetails: payDetails,
            responsehashKey: responsehashKey,
            responseDecryptionKey: responseDecryptionKey,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AtomPaymentPage';

  static const _i7.PageInfo<AtomPaymentPageArgs> page =
      _i7.PageInfo<AtomPaymentPageArgs>(name);
}

class AtomPaymentPageArgs {
  const AtomPaymentPageArgs({
    required this.mode,
    required this.payDetails,
    required this.responsehashKey,
    required this.responseDecryptionKey,
    this.key,
  });

  final dynamic mode;

  final dynamic payDetails;

  final dynamic responsehashKey;

  final dynamic responseDecryptionKey;

  final _i8.Key? key;

  @override
  String toString() {
    return 'AtomPaymentPageArgs{mode: $mode, payDetails: $payDetails, responsehashKey: $responsehashKey, responseDecryptionKey: $responseDecryptionKey, key: $key}';
  }
}

/// generated route for
/// [_i2.DashboardScreen]
class DashboardRoute extends _i7.PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    _i8.Key? key,
    String? uid,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          DashboardRoute.name,
          args: DashboardRouteArgs(
            key: key,
            uid: uid,
          ),
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i7.PageInfo<DashboardRouteArgs> page =
      _i7.PageInfo<DashboardRouteArgs>(name);
}

class DashboardRouteArgs {
  const DashboardRouteArgs({
    this.key,
    this.uid,
  });

  final _i8.Key? key;

  final String? uid;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key, uid: $uid}';
  }
}

/// generated route for
/// [_i3.GymFormPage]
class GymFormPage extends _i7.PageRouteInfo<void> {
  const GymFormPage({List<_i7.PageRouteInfo>? children})
      : super(
          GymFormPage.name,
          initialChildren: children,
        );

  static const String name = 'GymFormPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PaymentPage]
class PaymentPage extends _i7.PageRouteInfo<PaymentPageArgs> {
  PaymentPage({
    _i8.Key? key,
    String? args,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          PaymentPage.name,
          args: PaymentPageArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentPage';

  static const _i7.PageInfo<PaymentPageArgs> page =
      _i7.PageInfo<PaymentPageArgs>(name);
}

class PaymentPageArgs {
  const PaymentPageArgs({
    this.key,
    this.args,
  });

  final _i8.Key? key;

  final String? args;

  @override
  String toString() {
    return 'PaymentPageArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [_i5.ScreenHandlerPage]
class RouteHandlerPage extends _i7.PageRouteInfo<void> {
  const RouteHandlerPage({List<_i7.PageRouteInfo>? children})
      : super(
          RouteHandlerPage.name,
          initialChildren: children,
        );

  static const String name = 'RouteHandlerPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.WebLoginPage]
class WebLoginPage extends _i7.PageRouteInfo<void> {
  const WebLoginPage({List<_i7.PageRouteInfo>? children})
      : super(
          WebLoginPage.name,
          initialChildren: children,
        );

  static const String name = 'WebLoginPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
