
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../features/screens/splash_screen.dart';
import '../main/root/root_view.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(name: Routes.splash, page: () => const SplashScreen()),
    GetPage(name: Routes.root, page: () => const RootView(0)), //binding: RootBinding()

  ];

}
