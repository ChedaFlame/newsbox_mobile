

import 'package:flutter/material.dart';
import 'package:get/get.dart'  as Getit;
import '../app_utils/common/theme_colors.dart';
import '../routes/app_pages.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainApp extends StatefulWidget {
  const MainApp( {super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  final _navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Getit.GetMaterialApp(
      initialRoute: AppPages.initial,
      // showPerformanceOverlay: true,
      onReady: () async {

      },
      navigatorKey: _navKey,
      getPages: AppPages.routes,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // S.delegate
      ],
      debugShowCheckedModeBanner: false,
      defaultTransition: Getit.Transition.fade,// .cupertino,
      navigatorObservers: [RouteObserverService()], // Attach the observer
    );
  }

}


class RouteObserverService extends NavigatorObserver {
  static final List<Route<dynamic>> _stack = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _stack.add(route);
    debugPrint("Screen Pushed: ${route.settings.name}, Stack size: ${_stack.length}");
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _stack.remove(route);
    debugPrint("Screen Popped: ${route.settings.name}, Stack size: ${_stack.length}");
  }

  static int getStackSize() => _stack.length;
}