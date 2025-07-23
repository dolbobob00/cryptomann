
import 'package:cryptomann/src/domain/settings/settings.dart';
import 'package:flutter/material.dart';

class CurrencyChanger extends StatefulWidget {
  const CurrencyChanger({super.key, required this.onChanged});
  final VoidCallback onChanged;
  @override
  State<CurrencyChanger> createState() => _CurrencyChangerState();
}

class _CurrencyChangerState extends State<CurrencyChanger> {
  String? _pickedCurrency;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      label: Text(
        _pickedCurrency ?? 'Change currency',
        style: Theme.of(context).textTheme.labelSmall,
      ),
      dropdownMenuEntries: Currency.values.map(
        (e) {
          return DropdownMenuEntry(
            value: e.name,
            label: e.name,
          );
        },
      ).toList(),
      onSelected: (value) {
        setState(() {
          _pickedCurrency = value;
        });
        Settings().changeCurrency(
          value: value,
        );
        widget.onChanged();
      },
    );
  }
}
