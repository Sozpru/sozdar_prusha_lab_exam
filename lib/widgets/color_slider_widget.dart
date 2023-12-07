import 'package:flutter/material.dart';

class ColorSliderWidget extends StatefulWidget {
  final bool allowChangePrimerColor;
  final void Function(double red, double green, double blue) onColorChanged;

  const ColorSliderWidget({
    required this.allowChangePrimerColor,
    required this.onColorChanged,
  });

  @override
  _ColorSliderWidgetState createState() => _ColorSliderWidgetState();
}

class _ColorSliderWidgetState extends State<ColorSliderWidget> {
  double redValue = 0;
  double greenValue = 0;
  double blueValue = 0;

  Color get iconColor => Color.fromRGBO(
        redValue.toInt(),
        greenValue.toInt(),
        blueValue.toInt(),
        1.0,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: redValue,
                  onChanged: (value) {
                    setState(() {
                      redValue = value;
                      _updateIconColor();
                    });
                    widget.onColorChanged(redValue, greenValue, blueValue);
                  },
                  min: 0,
                  max: 255,
                ),
              ),
              if (widget.allowChangePrimerColor)
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      redValue = 255;
                      _updateIconColor();
                    });
                    widget.onColorChanged(redValue, greenValue, blueValue);
                  },
                  backgroundColor: Colors.red,
                  child: Visibility(
                    visible: widget.allowChangePrimerColor,
                    child: Text(redValue.toInt().toString()),
                  ),
                ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: greenValue,
                  onChanged: (value) {
                    setState(() {
                      greenValue = value;
                      _updateIconColor();
                    });
                    widget.onColorChanged(redValue, greenValue, blueValue);
                  },
                  min: 0,
                  max: 255,
                ),
              ),
              if (widget.allowChangePrimerColor)
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      greenValue = 255;
                      _updateIconColor();
                    });
                    widget.onColorChanged(redValue, greenValue, blueValue);
                  },
                  backgroundColor: Colors.green,
                  child: Visibility(
                    visible: widget.allowChangePrimerColor,
                    child: Text(greenValue.toInt().toString()),
                  ),
                ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: blueValue,
                  onChanged: (value) {
                    setState(() {
                      blueValue = value;
                      _updateIconColor();
                    });
                    widget.onColorChanged(redValue, greenValue, blueValue);
                  },
                  min: 0,
                  max: 255,
                ),
              ),
              if (widget.allowChangePrimerColor)
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      blueValue = 255;
                      _updateIconColor();
                    });
                    widget.onColorChanged(redValue, greenValue, blueValue);
                  },
                  backgroundColor: Colors.blue,
                  child: Visibility(
                    visible: widget.allowChangePrimerColor,
                    child: Text(blueValue.toInt().toString()),
                  ),
                ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  void _updateIconColor() {
    setState(() {});
  }
}
