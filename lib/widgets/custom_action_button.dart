import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final bool allowResize;
  final double iconSize;
  final Function(double) onPressed;

  const CustomActionButton({
    required this.allowResize,
    required this.iconSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (!allowResize) {
      return Container();
    }

    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            onPressed(iconSize - 50.0);
          },
        ),
        _buildButton('S', 100.0),
        const SizedBox(width: 5),
        _buildButton('M', 300.0),
        const SizedBox(width: 5),
        _buildButton('L', 500.0),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            onPressed(iconSize + 50.0);
          },
        ),
      ],
    );
  }

  IconButton _buildButton(String label, double size) {
    return IconButton(
      icon: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      onPressed: () {
        onPressed(size);
      },
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
