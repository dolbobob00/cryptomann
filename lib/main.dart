import 'package:cryptomann/src/constants/theme/theme.dart';
import 'package:cryptomann/src/domain/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'src/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
  ServiceLocator.getItSetup();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => Themes(),
      ),
    ], child: MyApp()),
  );
}
