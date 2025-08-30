import 'package:cryptomann/src/data/coin/coin.dart';
import 'package:cryptomann/src/constants/router/router.dart';
import 'package:cryptomann/src/presentation/coin_info/widgets/card_wrapper.dart';
import 'package:flutter/material.dart';
class CoinInfo extends StatefulWidget {
  const CoinInfo({super.key});

  @override
  State<CoinInfo> createState() => _CoinInfoState();
}

class _CoinInfoState extends State<CoinInfo> {
  late final Coin coin;
  late final String heroTag;

  // Taking arguments from Routing
  @override
  void didChangeDependencies() {
    final arg = ModalRoute.of(context)?.settings.arguments;
    assert(arg != null && arg is Map<String, dynamic>,
        'Need to be Map model for work.');
    Map<String, dynamic> arguments = arg as Map<String, dynamic>;
    coin = arguments['coin'];
    heroTag = arguments['heroTag'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final themeof = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            expandedHeight: 200,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Center(
                child: Hero(
                  tag: heroTag,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(coin.imageUrl),
                  ),
                ),
              ),
              title: Text(
                coin.title,
                style: themeof.textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
            ),
            leading: IconButton(
              onPressed: () => routerKey.currentState?.pop(),
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            toolbarHeight: 170,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CardWrapper(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Current price: ${coin.price}',
                            style: themeof.textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CardWrapper(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Change per day: ${coin.changePerDay}',
                            style: themeof.textTheme.labelSmall,
                          ),
                          Text(
                            'Low: ${coin.lowDay}',
                            style: themeof.textTheme.labelSmall,
                          ),
                          Text(
                            'High: ${coin.highDay}',
                            style: themeof.textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.question_mark,
                  ),
                  Text(
                    'Nothing there uWu!',
                    style: themeof.textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
