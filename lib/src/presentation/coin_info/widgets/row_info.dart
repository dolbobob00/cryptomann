import 'package:cryptomann/src/data/coin/coin.dart';
import 'package:flutter/material.dart';

class RowInfo extends StatelessWidget {
  const RowInfo({super.key, required this.text, required this.iconPlace});

  final Widget iconPlace;
  final String text;
  @override
  Widget build(BuildContext context) {
    final themeof = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: themeof.colorScheme.inversePrimary,
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: themeof.colorScheme.inversePrimary,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                iconPlace,
                Text(
                  text,
                  style: themeof.textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
