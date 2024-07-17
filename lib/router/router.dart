import 'package:auto_route/auto_route.dart';
import 'package:gymwebapp/pages/dashboards/dashboard.dart';

import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        //HomeScreen is generated as HomeRoute because
        //of the replaceInRouteName property
        AutoRoute(
          path: '/',
          page: RouteHandlerPage.page,
        ),
        AutoRoute(path: '/formpage', page: GymFormPage.page),
        AutoRoute(path: '/WebLoginPage', page: WebLoginPage.page),
        AutoRoute(path: '/PaymentPage', page: PaymentPage.page),
        AutoRoute(path: '/DashboardRoute', page: DashboardRoute.page),
      
      ];
}
