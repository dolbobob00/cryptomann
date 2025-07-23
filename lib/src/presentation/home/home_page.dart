import 'dart:async';

import 'package:cryptomann/src/domain/repository/coins_repo/abstract_coins_repo.dart';

import 'package:cryptomann/src/presentation/home/bloc/home_bloc.dart';
import 'package:cryptomann/src/presentation/home/widgets/coin_tile.dart';

import 'package:cryptomann/src/presentation/home/widgets/settings_dialogue.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //Widget Build
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CoinsBloc>()
      ..add(
        CoinsloadEvent(),
      );
    void getCoins({Completer? completer}) {
      bloc.add(
        CoinsloadEvent(
          completer: completer,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CryptoCurrencyList',
        ),
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => SettingsDialogue(
                currencyChanger: getCoins,
              ),
            );
          },
          icon: Icon(
            Icons.settings,
          ),
        ),
        centerTitle: true,
        bottomOpacity: 0,
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          final completer = Completer();
          getCoins(completer: completer);
          return  completer.future;
        },
        child: BlocBuilder<CoinsBloc, CoinsState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is CoinsError) {
              return Center(
                child: Text(
                  state.error ?? 'Error, try again.',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              );
            } else if (state is CoinsLoading) {
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is CoinsLoaded) {
              return ListView.separated(
                itemCount: state.coins.length,
                itemBuilder: (context, index) {
                  var coinInfo = state.coins[index];
                  var heroTag = 'CoinTile$index';
                  return CoinTile(
                    heroTag: heroTag,
                    coin: Coin(
                      title: coinInfo.title,
                      changePerDay: coinInfo.changePerDay,
                      imageUrl: coinInfo.imageUrl,
                      price: coinInfo.price,
                      highDay: coinInfo.highDay,
                      lowDay: coinInfo.lowDay,
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  endIndent: 25,
                  indent: 25,
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
