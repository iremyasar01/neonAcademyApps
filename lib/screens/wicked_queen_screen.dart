import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class WickedQueenScreen extends StatefulWidget {
  const WickedQueenScreen({super.key});

  @override
  State<WickedQueenScreen> createState() => _WickedQueenScreenState();
}

class _WickedQueenScreenState extends State<WickedQueenScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? _emailError;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _validateEmail(String value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    setState(() {
      _emailError = emailRegex.hasMatch(value) ? null : 'Invalid email format';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Queen\'s Academy Challenge'),
        backgroundColor: Colors.blue[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Name-Surname Field
            TextField(
              controller: _nameController,
              decoration:const InputDecoration(
                hintText: "Enter Name-Surname",
                hintStyle: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(),
                errorText: null,
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => FocusScope.of(context).unfocus(),
            ),

            const SizedBox(height: 20),

            
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Enter Email",
                hintStyle: const TextStyle(
                  color: Colors.blue,
                  fontStyle: FontStyle.italic,
                ),
                border: const OutlineInputBorder(),
                errorText: _emailError,
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: _validateEmail,
            ),

            const SizedBox(height: 20),

            
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                hintText: "Enter Phone Number",
                hintStyle:  TextStyle(
                  color: Colors.green,
                  decoration: TextDecoration.underline,
                ),
                border:  OutlineInputBorder(),
                counterText: '',
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              maxLength: 10,
            ),
          ],
        ),
      ),
    );
  }
}

