import 'package:cryptomann/src/domain/repository/coins_repo/abstract_coins_repo.dart';

class CoinsRepository implements ICoinsRepository {

  CoinsRepository(
    {
      required this.dio, required this.settings,
    }
  );

  //Vars
  final String repoAdress =
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,SOL,DOGE,BRD,BSTN,BNB&tsyms=USD,EUR';
  final Dio dio;

  final Settings settings;

  String? currency;

  //Logic

  @override
  Future<List<Coin>> getAllCoins() async {
    checkCurrency();
    try {
      final responce =
          ((await dio.get(repoAdress)).data['DISPLAY']) as Map<String, dynamic>;
      final List<Coin> coinsList = (responce.entries.map(
        (e) {
          return Coin(
            title: e.key,
            price: e.value[currency]['PRICE'].toString(),
            imageUrl:
                'https://www.cryptocompare.com/${e.value[currency]['IMAGEURL']}',
            changePerDay: e.value[currency]['CHANGE24HOUR'].toString(),
            lowDay: e.value[currency]['lowDay'].toString(),
            highDay: e.value[currency]['HIGHDAY'].toString(),
          );
        },
      ).toList());
      debugPrint(
        coinsList.toString(),
      );
      return coinsList;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  void checkCurrency() {
    currency = settings.currentCurrency;
  }
}
