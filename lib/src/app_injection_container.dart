import 'package:converse/src/core/core.dart';
import 'package:converse/src/core/data/repo/token_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class AppInjectionContainer {
  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => prefs);
    sl.registerLazySingleton<TokenRepository>(
      () => TokenRepositoryImpl(
        sharedPreferences: sl(),
      ),
    );
    sl.registerLazySingleton<ApiClient>(
      () => ApiClient(
        tokenRepository: sl(),
      ),
    );
  }
}
