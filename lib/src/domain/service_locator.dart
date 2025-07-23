import 'package:cryptomann/src/constants/theme/theme.dart';
import 'package:cryptomann/src/domain/repository/coins_repo/abstract_coins_repo.dart';
import 'package:cryptomann/src/domain/repository/coins_repo/coins_repo.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.I;

class ServiceLocator {
  static void getItSetup() {
    // non needed priority

    getIt.registerSingleton<Settings>(
      Settings(),
    );
    getIt.registerSingleton<Themes>(
      Themes(),
    );
    // Later than network and settings register
    getIt.registerSingleton<ICoinsRepository>(
      CoinsRepository(
        dio: Dio(),
        settings: getIt.get<Settings>(),
      ),
    );
  }
}
