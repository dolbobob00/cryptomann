import 'package:flutter/material.dart';

import '../../presentation/coin_info/coin_info.dart';
import '../../presentation/home/home_page.dart';

final GlobalKey<NavigatorState> routerKey = GlobalKey<NavigatorState>();

final routes = {
  '/': (_) => HomePage(),
  'coin_info': (_) => CoinInfo(),
};
