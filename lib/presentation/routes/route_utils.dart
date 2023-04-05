import 'package:flutter/cupertino.dart';
import 'package:flutter_starter/presentation/routes/route_constants.dart';
import 'package:flutter_starter/presentation/ui/screens/home_screen/home_screen_app.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:injectable/injectable.dart';

Provider<GoRouter> routerProvider = Provider((ref) => RouteUtils.router(ref));

@singleton
class RouteUtils {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static router(ProviderRef ref) {
    return GoRouter(
        initialLocation: RouterConstants.splash,
        navigatorKey: _rootNavigatorKey,
        routes: [
          ShellRoute(
              navigatorKey: _shellNavigatorKey,
              builder: (context, state, child) {
                return Container();
                // return  HomePage(screen: child);
              },
              routes: [
                GoRoute(
                  path: RouterConstants.dashboard,
                  builder: (context, state) {
                    return Container();
                    // return const DashboardPage()
                  },
                ),
                GoRoute(
                  path: RouterConstants.profile,
                  builder: (context, state) {
                    return Container();
                    // return const ProfilePage()
                  },
                ),
                GoRoute(
                  path: RouterConstants.setting,
                  builder: (context, state) {
                    return Container();
                    // return const SearchPage();
                  },
                ),
              ]),
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: RouterConstants.splash,
            builder: (context, state) {
              return HomeScreenApp();
              // return const SplashPage();
            },
          ),
        ]);
  }
}
