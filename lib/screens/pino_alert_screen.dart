import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PinoAlertScreen extends StatefulWidget {
  const PinoAlertScreen({super.key});

  @override
  State<PinoAlertScreen> createState() => _PinoAlertScreenState();
}

class _PinoAlertScreenState extends State<PinoAlertScreen> {
  final TextEditingController _textController = TextEditingController();

  void _showSimpleAlert() {
    showDialog(
      context: context,
      builder: (_) => const AlertDialog(
        title: Text('📢 Simple Alert'),
        content: Text('This alert has no buttons. Just a message!'),
      ),
    );
  }

  void _showOneButtonAlert() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('👍 One Button'),
        content: const Text('Click the button below.'),
        actions: [
          TextButton(
            onPressed: () {
              debugPrint('Button: OK');
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showTwoButtonAlert() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('⚔️ Two Options'),
        content: const Text('Choose wisely.'),
        actions: [
          TextButton(
            onPressed: () {
              debugPrint('Button: Accept');
              Navigator.pop(context);
            },
            child: const Text('Accept'),
          ),
          TextButton(
            onPressed: () {
              debugPrint('Button: Decline');
              Navigator.pop(context);
            },
            child: const Text('Decline'),
          ),
        ],
      ),
    );
  }

  void _showTextFieldAlert() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('📝 Input Alert'),
        content: TextField(
          controller: _textController,
          decoration: const InputDecoration(hintText: "Type something..."),
        ),
        actions: [
          TextButton(
            onPressed: () {
              debugPrint('Entered Text: ${_textController.text}');
              _textController.clear();
              Navigator.pop(context);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _showActionSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('View Gallery'),
              onTap: () {
                debugPrint('Action: View Gallery');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                debugPrint('Action: Settings');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                debugPrint('Action: Logout');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showActivityController() async {
    final box = context.findRenderObject() as RenderBox?;

    try {
      // Görseli assets klasöründen yükleyip geçici dizine yazıyoruz
      final byteData = await rootBundle.load('assets/images/castle.png');
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/castle.png');
      await file.writeAsBytes(byteData.buffer.asUint8List());

      final result = await SharePlus.instance.share(
        ShareParams(
          text: 'Check out this awesome image!',
          subject: 'Pinocchio’s Shared Image',
          title: 'Share Image',
          files: [
            XFile(
              file.path,
              name: 'castle.png',
              mimeType: 'image/png',
            ),
          ],
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
        ),
      );

      debugPrint('Share result: ${result.status}');
    } catch (e) {
      debugPrint('Share Error: $e');
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🪵 Pinocchio's Alert Challenge"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            _buildButton("1️⃣ Simple Alert (No Buttons)", _showSimpleAlert),
            _buildButton("2️⃣ Alert with One Button", _showOneButtonAlert),
            _buildButton("3️⃣ Alert with Two Buttons", _showTwoButtonAlert),
            _buildButton("4️⃣ Alert with TextField", _showTextFieldAlert),
            _buildButton("5️⃣ Show Action Sheet", _showActionSheet),
            _buildButton("6️⃣ Share Image Activity Controller", _showActivityController),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orangeAccent,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(label, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
