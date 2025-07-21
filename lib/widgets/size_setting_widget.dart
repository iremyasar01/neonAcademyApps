import 'package:flutter/material.dart';

class SizeSettingWidget extends StatefulWidget {
  final Function(double) onAspectRatioChanged;
  final double initialRatio;

  const SizeSettingWidget({
    super.key,
    required this.onAspectRatioChanged,
    this.initialRatio = 0.7,
  });

  @override
  State<SizeSettingWidget> createState() => _SizeSettingWidgetState();
}

class _SizeSettingWidgetState extends State<SizeSettingWidget> {
  late double _aspectRatio;

  @override
  void initState() {
    super.initState();
    _aspectRatio = widget.initialRatio;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Grid boyutunu ayarla',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Slider(
          min: 0.6,
          max: 1.0,
          divisions: 18,
          value: _aspectRatio,
          label: _aspectRatio.toStringAsFixed(2),
          onChanged: (value) {
            setState(() => _aspectRatio = value);
            widget.onAspectRatioChanged(_aspectRatio);
          },
        ),
      ],
    );
  }
}

