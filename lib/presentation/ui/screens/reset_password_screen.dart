import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/validators.dart';  // Import the validators
import '../widget/app_logo.dart';
import '../widget/sign_in_section.dart';
import 'sign_in_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCMController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                const AppLogo(),
                const SizedBox(height: 8),
                Text(
                  'Set Password',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Minimum length of password should be more than 6 letters and a combination of numbers and letters',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'New Password'),
                  validator: Validators.validatePassword,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: _passwordCMController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Confirm Password'),
                  validator: (value) => Validators.validateConfirmPassword(
                      value, _passwordController.text),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: _onTapNextPage,
                  child: const Text('Confirm'),
                ),
                const SizedBox(height: 36),
                const SignInSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNextPage() {
    if (_formKey.currentState?.validate() ?? false) {
      Get.to(() => const SignInScreen());
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordCMController.dispose();
    super.dispose();
  }
}
