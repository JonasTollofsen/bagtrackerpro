import 'package:bagtrackerpro/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

enum Theme { light, dark, system }

class Themes extends StatefulWidget {
  const Themes({Key? key}) : super(key: key);

  @override
  State<Themes> createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  Theme _theme = Theme.light;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _theme == Theme.dark ? Color(0xFF111827) : Colors.white,
      appBar: buildCustomAppBar(
        headerTitle: 'Settings',
        subTitle: 'Set theme',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 70,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                'Light',
                style: TextStyle(
                  color:
                      _theme == Theme.dark ? Color(0xFFF9FAFB) : Colors.black,
                ),
              ),
              leading: Radio<Theme>(
                activeColor: primaryColorLight,
                value: Theme.light,
                groupValue: _theme,
                onChanged: (Theme? value) {
                  setState(() {
                    _theme = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                'Dark',
                style: TextStyle(
                  color:
                      _theme == Theme.dark ? Color(0xFFF9FAFB) : Colors.black,
                ),
              ),
              contentPadding: EdgeInsets.all(0),
              leading: Radio<Theme>(
                activeColor: primaryColorLight,
                value: Theme.dark,
                groupValue: _theme,
                onChanged: (Theme? value) {
                  setState(() {
                    _theme = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                'System',
                style: TextStyle(
                  color:
                      _theme == Theme.dark ? Color(0xFFF9FAFB) : Colors.black,
                ),
              ),
              contentPadding: EdgeInsets.all(0),
              leading: Radio<Theme>(
                activeColor: primaryColorLight,
                value: Theme.system,
                groupValue: _theme,
                onChanged: (Theme? value) {
                  setState(() {
                    _theme = value!;
                  });
                },
              ),
            ),
            Text(
              "If system is selected, the app will automatically adjust your appearance based on your phone's system settings.",
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
