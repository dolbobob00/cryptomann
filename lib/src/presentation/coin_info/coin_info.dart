import 'package:cryptomann/src/data/coin/coin.dart';
import 'package:cryptomann/src/constants/router/router.dart';
import 'package:flutter/material.dart';
import 'package:cryptomann/src/presentation/coin_info/widgets/row_info.dart';

class CoinInfo extends StatefulWidget {
  const CoinInfo({super.key});

  @override
  State<CoinInfo> createState() => _CoinInfoState();
}

class _CoinInfoState extends State<CoinInfo> {
  late final Coin coin;
  late final String heroTag;
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
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://wallpapers.com/images/high/re-zero-ram-1920-x-1080-wallpaper-61f4p7ddgtnasc3b.webp',
              ),
              title: Text(coin.title),
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
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(
                        tag: heroTag,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(
                            coin.imageUrl,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      RowInfo(
                        text: coin.price,
                        iconPlace: Icon(
                          Icons.money,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      RowInfo(
                        text: coin.changePerDay,
                        iconPlace: Icon(
                          Icons.event,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      RowInfo(
                        text: coin.changePerDay.contains('-')
                            ? 'Buy now!'
                            : 'Sell now!',
                        iconPlace: Icon(
                          Icons.money,
                        ),
                      ),
                    ],
                  ),
                ),
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
