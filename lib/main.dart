import 'dart:async';

import 'package:cryptomann/src/constants/theme/theme.dart';
import 'package:cryptomann/src/domain/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'src/presentation/app.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

    // System Settings
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );
    await ServiceLocator.getItSetup();

    FlutterError.onError = (details) {
      getIt<Talker>().handle(details.exception, details.stack);
    };

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => Themes(),
          ),
        ],
        child: MyApp(),
      ),
    );
}
