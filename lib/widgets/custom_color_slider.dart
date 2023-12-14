import 'package:flutter/material.dart';

class CustomColorSlider extends StatefulWidget {
  final bool allowChangePrimaryColor;
  final void Function(double red, double green, double blue) onColorChanged;

  const CustomColorSlider({
    required this.allowChangePrimaryColor,
    required this.onColorChanged,
  });

  @override
  _CustomColorSliderState createState() => _CustomColorSliderState();
}

class _CustomColorSliderState extends State<CustomColorSlider> {
  double redValue = 0;
  double greenValue = 0;
  double blueValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSliderRow(redValue, Colors.red),
          buildSliderRow(greenValue, Colors.green),
          buildSliderRow(blueValue, Colors.blue),
        ],
      ),
    );
  }

  Widget buildSliderRow(double value, Color color) {
    return Row(
      children: [
        Expanded(
          child: Slider(
            value: value,
            onChanged: (newValue) {
              setState(() {
                updateColor(value, newValue, color);
              });
              widget.onColorChanged(redValue, greenValue, blueValue);
            },
            min: 0,
            max: 255,
          ),
        ),
        buildColorButton(value, color),
      ],
    );
  }

  Widget buildColorButton(double value, Color color) {
    return widget.allowChangePrimaryColor
        ? FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              setState(() {
                updateColor(value, 255, color);
              });
              widget.onColorChanged(redValue, greenValue, blueValue);
            },
            mini: true,
            backgroundColor: color,
            child: Visibility(
              visible: widget.allowChangePrimaryColor,
              child: Text(value.toInt().toString()),
            ),
          )
        : Text(value.toInt().toString());
  }

  void updateColor(double oldValue, double newValue, Color color) {
    switch (color) {
      case Colors.red:
        redValue = newValue;
        greenValue = 0;
        blueValue = 0;
        break;
      case Colors.green:
        redValue = 0;
        greenValue = newValue;
        blueValue = 0;
        break;
      case Colors.blue:
        redValue = 0;
        greenValue = 0;
        blueValue = newValue;
        break;
    }
  }
}
