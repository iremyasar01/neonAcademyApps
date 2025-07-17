import 'package:flutter/material.dart';
import 'package:flutter_font_picker/flutter_font_picker.dart';

class FontPickerScreen extends StatelessWidget {
  final Function(String) onFontSelected;
  final String? currentFont;

  const FontPickerScreen({
    super.key,
    required this.onFontSelected,
    this.currentFont,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Choose Font")),
      body: FontPicker(
        onFontChanged: (font) {
          onFontSelected(font.fontFamily);
          //print("Font seçildi: ${font.fontFamily}");
          Navigator.pop(context); 
        },
      ),
    );
  }
}

