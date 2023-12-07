import 'package:flutter/material.dart';

import '../widgets/color_slider_widget.dart';

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
        title: Text('Icon App'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          if (allowResize)
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  iconSize -= 50.0;
                });
              },
            ),
          if (allowResize)
            TextButton(
              onPressed: () {
                setState(() {
                  iconSize = 100.0;
                });
              },
              child: Text('S'),
            ),
          if (allowResize)
            TextButton(
              onPressed: () {
                setState(() {
                  iconSize = 300.0;
                });
              },
              child: Text('M'),
            ),
          if (allowResize)
            TextButton(
              onPressed: () {
                setState(() {
                  iconSize = 500.0;
                });
              },
              child: Text('L'),
            ),
          if (allowResize)
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  iconSize += 50.0;
                });
              },
            ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            CheckboxListTile(
              title: Text('Allow Resize'),
              value: allowResize,
              onChanged: (value) {
                setState(() {
                  allowResize = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Allow Change Primer Color'),
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
      body: Center(
        child: Icon(Icons.star,
            size: iconSize,
            color: allowChangePrimerColor
                ? Theme.of(context).colorScheme.primary
                : iconColor),
      ),
      bottomNavigationBar: ColorSliderWidget(
        allowChangePrimerColor: allowChangePrimerColor,
        onColorChanged: (double red, double green, double blue) {
          setState(() {
            redValue = red;
            greenValue = green;
            blueValue = blue;
          });
        },
      ),
    );
  }
}
