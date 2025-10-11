import 'package:get_it/get_it.dart';

import '../../features/screens/repository/articles_repo.dart';
import '../../features/screens/repository/articles_repo_impl.dart';

final _locator = GetIt.instance;
GetIt get moduleLocator => _locator;

Future<void> initRemoteDataModules() async {
  _initServiceAndRepositoryModules();
}

void _initServiceAndRepositoryModules() {
  _locator.registerLazySingleton<ArticlesRepository>(() => ArticlesRepositoryImpl());

}



