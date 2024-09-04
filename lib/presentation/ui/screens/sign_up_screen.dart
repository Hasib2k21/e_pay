import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/validators.dart';  // Import the validators
import '../widget/app_logo.dart';
import '../widget/custom_container.dart';
import '../widget/sign_in_section.dart';
import 'email_verification_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isFilled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomContainer(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppLogo(),
                      const SizedBox(height: 15),
                      Text(
                        'Connect to your ePayeer account',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _nameController,
                      decoration: const InputDecoration(hintText: 'Your Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: _phoneController,
                      decoration: const InputDecoration(hintText: 'Your Phone Number'),
                      validator: (value) => Validators.validatePhone(value),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _emailController,
                      decoration: const InputDecoration(hintText: 'Email'),
                      validator: Validators.validateEmail,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(hintText: 'Password'),
                      validator: Validators.validatePassword,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(hintText: 'Confirm Password'),
                      validator: (value) => Validators.validateConfirmPassword(
                          value, _passwordController.text),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Checkbox(value: isFilled, onChanged: (value) {
                          setState(() {
                            isFilled = value ?? false;
                          });
                        }),
                        const Expanded(
                          child: Text(
                            'By signing up, you agree to Bank\'s Term of Use & Privacy Policy.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _onTapSignUp,
                          child: const Text('SIGN UP'),
                        ),
                        const SizedBox(width: 10),
                        const Text('or'),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                            setState(() {
                              isFilled = !isFilled; // Toggle the value of isFilled
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isFilled ? AppColors.themeColor : Colors.white,
                            side: const BorderSide(
                              color: AppColors.themeColor, // Border color
                              width: 0.70, // Border width
                            ),
                          ),
                          child: Text(
                            'CANCEL',
                            style: TextStyle(
                              color: isFilled ? Colors.white : AppColors.themeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 36),
                    const SignInSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSignUp() {
    if (_formKey.currentState?.validate() ?? false) {
      // Proceed with sign-up logic, e.g., navigation or API call
      Get.to(() => const EmailVerificationScreen());
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
