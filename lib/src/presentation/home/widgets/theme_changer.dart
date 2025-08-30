import 'package:cryptomann/src/constants/theme/theme.dart';
import 'package:cryptomann/src/domain/service_locator.dart';
import 'package:flutter/material.dart';

class ThemeChanger extends StatefulWidget {
  const ThemeChanger({super.key,});

  @override
  State<ThemeChanger> createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  String? _pickedTheme;
  final Themes themes = getIt.get<Themes>();
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      label: Text(
        _pickedTheme ?? 'Change theme',
        style: Theme.of(context).textTheme.labelSmall,
      ),
      dropdownMenuEntries: ThemeNames.values.map(
        (e) {
          return DropdownMenuEntry(
            value: e.name,
            label: e.name,
          );
        },
      ).toList(),
      onSelected: (value) {
        setState(() {
          _pickedTheme = value;
        });
        themes.switchThemeTo(
          name: value,
        );

      },
    );
  }
}
