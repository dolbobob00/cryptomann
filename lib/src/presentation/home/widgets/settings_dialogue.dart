import 'package:cryptomann/src/constants/router/router.dart';
import 'package:cryptomann/src/presentation/home/widgets/currency_changer.dart';
import 'package:cryptomann/src/presentation/home/widgets/theme_changer.dart';
import 'package:flutter/material.dart';

class SettingsDialogue extends StatelessWidget {
  const SettingsDialogue({super.key, required this.currencyChanger});

  final VoidCallback currencyChanger;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CurrencyChanger(
            onChanged: currencyChanger,
          ),
          ThemeChanger(),
          Row(
            children: [
              TextButton.icon(
                label: Text('Close'),
                onPressed: () {
                  routerKey.currentState?.pop();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
