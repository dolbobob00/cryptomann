import 'package:bloc/bloc.dart';
import 'package:cryptomann/src/constants/theme/theme.dart';
import 'package:cryptomann/src/data/repository/coins_repo/abstract_coins_repo.dart';
import 'package:cryptomann/src/data/repository/coins_repo/coins_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

final GetIt getIt = GetIt.I;

class ServiceLocator {
  static Future<void> getItSetup() async {
    // Register Modules
    _registerLoggingRelated();

    _registerCoreRelated();

    _registerNetworkRelated();

    _registerRepositories();

    // Ready Man
    await getIt.allReady();
  }

  static void _registerLoggingRelated() {
    if (!getIt.isRegistered<Talker>()) {
      final talker = TalkerFlutter.init(
        settings: TalkerSettings(
          useConsoleLogs: kDebugMode,
          useHistory: kDebugMode,
        ),
      );

      // Bloc logging with talker
      Bloc.observer = TalkerBlocObserver(
        talker: talker,
        settings: TalkerBlocLoggerSettings(
          printStateFullData: false,
        ),
      );

      getIt.registerSingleton<Talker>(
        talker,
      );
    }
  }

  static void _registerCoreRelated() {
    if (!getIt.isRegistered<Settings>()) {
      getIt.registerSingleton<Settings>(
        Settings(),
      );
    }

    if (!getIt.isRegistered<Themes>()) {
      getIt.registerSingleton<Themes>(
        Themes(),
      );
    }
  }

  static void _registerNetworkRelated() {
    if (!getIt.isRegistered<Dio>()) {
      final dio = Dio();
      dio.interceptors.add(
        TalkerDioLogger(
          talker: getIt<Talker>(),
          settings: const TalkerDioLoggerSettings(
            printResponseData: false,
          ),
        ),
      );
      getIt.registerSingleton<Dio>(dio);
    }
  }

  static void _registerRepositories() {
    if (!getIt.isRegistered<ICoinsRepository>()) {
      // Later than network and settings register
      getIt.registerSingleton<ICoinsRepository>(
        CoinsRepository(
          dio: getIt<Dio>(),
          settings: getIt.get<Settings>(),
        ),
      );
    }
  }
}
