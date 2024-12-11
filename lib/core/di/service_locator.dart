import 'package:get_it/get_it.dart';
import 'package:tamenny_app/core/databases/cache_helper.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}
