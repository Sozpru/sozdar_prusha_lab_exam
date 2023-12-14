import 'package:flutter/material.dart';

import '../widgets/custom_action_button.dart';
import '../widgets/custom_color_slider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double iconSize = 100.0;
  bool allowResize = true;
  bool allowChangePrimerColor = true;

  int _colorValue(double value) => value.toInt().clamp(0, 255);

  Color get iconColor => Color.fromRGBO(
        _colorValue(redValue),
        _colorValue(greenValue),
        _colorValue(blueValue),
        1.0,
      );

  double redValue = 0;
  double greenValue = 0;
  double blueValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        title: Text(
          'My Icon',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            color: Theme.of(context).colorScheme.onPrimary,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          CustomActionButton(
            allowResize: allowResize,
            iconSize: iconSize,
            onPressed: (double size) {
              setState(() {
                iconSize = size;
              });
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            CheckboxListTile(
              title: const Text('Allow Resize'),
              value: allowResize,
              onChanged: (value) {
                setState(() {
                  allowResize = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Allow Change Primer Color'),
              value: allowChangePrimerColor,
              onChanged: (value) {
                setState(() {
                  allowChangePrimerColor = value!;
                });
              },
            ),
          ],
        ),
      ),
      body: Stack(children: [
        Center(
          child: Icon(Icons.star, size: iconSize, color: iconColor),
        ),
        Positioned.fill(
          bottom: 0,
          child: CustomColorSlider(
            allowChangePrimaryColor: allowChangePrimerColor,
            onColorChanged: (double red, double green, double blue) {
              setState(() {
                redValue = red;
                greenValue = green;
                blueValue = blue;
              });
            },
          ),
        ),
      ]),
    );
  }
}
