import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/connectivity/connectivity_bloc.dart';
import '../../features/screens/bloc/articles_bloc.dart';
import '../../features/screens/repository/articles_repo.dart';
import '../data/providers/app_server_provider.dart';
import '../env/env_config.dart';
import '../main/main_app.dart';
import 'module_locator.dart';



const iOSLocalizedLabels = false;
Future<void> initServices(EnvConfig environment) async {
  Get.log('starting services ...');
  // await GetStorage.init();
  await initRemoteDataModules();
  await Get.putAsync(() => AppApiClient(environment).init());
  Get.log('All services started...');
}

Future<void> provideMainApp(
    {required EnvConfig environment}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices(environment);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MultiBlocProvider(
          providers: [
            _configureInternetConnectivityCubit(),
            _configureArticlesBloc(),
          ],
          child:
          MainApp(),
        ),
    );
  });
}

BlocProvider<ConnectivityBloc> _configureInternetConnectivityCubit() {
  return BlocProvider<ConnectivityBloc>(
    create: (internetCubitContext) => ConnectivityBloc(EmptyConnectivityState()),//..add(CheckConnectivityEvent()),
  );
}


BlocProvider<ArticlesBloc> _configureArticlesBloc() {
  return BlocProvider<ArticlesBloc>(
    lazy: true,
    create: (context) => ArticlesBloc(ArticlesEmptyState(),
        repository: moduleLocator<ArticlesRepository>()),
  );
}

