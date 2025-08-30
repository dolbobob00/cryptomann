import 'package:cryptomann/src/constants/env_constants/constants_env.dart';
import 'package:cryptomann/src/data/repository/coins_repo/abstract_coins_repo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CoinsRepository implements ICoinsRepository {
  CoinsRepository({
    required this.dio,
    required this.settings,
  });

  //Vars
  final String repoAdress = dotenv.get(ConstantsEnv.cryptoApi);

  final Dio dio;

  final Settings settings;

  //Logic

  @override
  Future<List<Coin>> getAllCoins() async {
    try {
      final responce =
          ((await dio.get(repoAdress)).data['DISPLAY']) as Map<String, dynamic>;
      final List<Coin> coinsList = (responce.entries.map(
        (e) {
          return Coin(
            title: e.key,
            price: e.value[ settings.currentCurrency]['PRICE'].toString(),
            imageUrl:
                'https://www.cryptocompare.com/${e.value[settings.currentCurrency]['IMAGEURL']}',
            changePerDay: e.value[ settings.currentCurrency]['CHANGE24HOUR'].toString(),
            lowDay: e.value[ settings.currentCurrency]['LOWDAY'].toString(),
            highDay: e.value[ settings.currentCurrency]['HIGHDAY'].toString(),
          );
        },
      ).toList());
      return coinsList;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

}
