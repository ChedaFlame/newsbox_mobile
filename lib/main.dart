import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'app/di/provide_main_app.dart';
import 'app/env/env_config.dart';



main() {
  setUrlStrategy(const HashUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();
  provideMainApp(environment: EnvironmentValue.dev);

}