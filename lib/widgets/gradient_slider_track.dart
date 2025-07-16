import 'package:flutter/material.dart';

class GradientSliderTrackShape extends SliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 6.0;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    required RenderBox parentBox,
    Offset? secondaryOffset,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required Offset thumbCenter,
  }) {
    final trackHeight = sliderTheme.trackHeight ?? 6.0;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final trackWidth = parentBox.size.width;

    final trackRect = Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);

    const gradient =  LinearGradient(colors: [Colors.green, Colors.red]);
    final paint = Paint()
      ..shader = gradient.createShader(trackRect)
      ..style = PaintingStyle.fill;

    // Draw the gradient track
    context.canvas.drawRRect(
      RRect.fromRectAndRadius(trackRect, const Radius.circular(4)),
      paint,
    );

    // Draw the magic 50 indicator
    if (isEnabled) {
      final magicPosition = trackLeft + (trackWidth * 0.5);
      final magicPaint = Paint()
        ..color = Colors.blue
        ..strokeWidth = 2.0
        ..style = PaintingStyle.stroke;
      
      context.canvas.drawLine(
        Offset(magicPosition, trackTop - 5),
        Offset(magicPosition, trackTop + trackHeight + 5),
        magicPaint,
      );
    }
  }
}
