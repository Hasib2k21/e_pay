import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/validators.dart';  // Import the validators
import '../widget/app_logo.dart';
import '../widget/sign_in_section.dart';
import 'pin_verification_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppLogo(),
              const SizedBox(height: 8),
              Text(
                'Your Email Address',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'A 6 digits verification pin will be sent to your email address',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.black54),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Email'),
                validator: Validators.validateEmail,
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _onTapNextPage,
                child: const Text('Verify Email'),
              ),
              const SizedBox(height: 36),
              const SignInSection(),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapNextPage() {
    if (_formKey.currentState?.validate() ?? false) {
      Get.offAll(() => const PinVerificationScreen());
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
