import 'package:cryptomann/src/constants/theme/theme.dart';
import 'package:cryptomann/src/domain/repository/coins_repo/abstract_coins_repo.dart';
import 'package:cryptomann/src/domain/service_locator.dart';
import 'package:cryptomann/src/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CoinsBloc(
            coinsRepository: getIt.get<ICoinsRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        navigatorKey: routerKey,
        routes: routes,
        theme: context.watch<Themes>().getCurrentTheme(),
      ),
    );
  }
}
