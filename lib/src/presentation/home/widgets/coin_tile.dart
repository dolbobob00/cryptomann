import 'package:cryptomann/src/data/coin/coin.dart';
import 'package:cryptomann/src/constants/router/router.dart';
import 'package:flutter/material.dart';

class CoinTile extends StatelessWidget {
  const CoinTile({super.key, required this.coin, required this.heroTag});
  final Coin coin;
  final String heroTag;
  @override
  Widget build(BuildContext context) {
    final themeof = Theme.of(context);
    return ListTile(
        title: Text(
          coin.title,
          style: themeof.textTheme.labelMedium,
        ),
        subtitle: Text(
          coin.price,
          style: themeof.textTheme.labelSmall,
        ),
        leading: Hero(
          tag: heroTag,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              coin.imageUrl,
            ),
            maxRadius: 24,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
        ),
        onTap: () => routerKey.currentState?.pushNamed(
              'coin_info',
              arguments: {
                'coin': coin,
                'heroTag': heroTag,
              },
            ));
  }
}
