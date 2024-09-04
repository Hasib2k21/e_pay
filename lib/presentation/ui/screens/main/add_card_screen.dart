import 'package:e_pay/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        // Background color of the app bar
        leading: const Icon(Icons.menu, color: Colors.white),
        // The menu icon on the left
        title: const Center(
          child: Text(
            'ADD CARD',
            style: TextStyle(color: Colors.white), // Text color
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            // Settings icon on the right
            onPressed: () {
              // Add your onPressed code here!
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bank Card Display
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'BANK NAME',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Replace this with another widget or add the correct asset image
                      Container(
                        width: 50,
                        height: 30,
                        color: Colors.white, // Placeholder for image
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '**** **** **** 1234',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text("YOUR NAME"),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Enter your Name'),
              ),
              const SizedBox(height: 20),
              const Text("CARD NUMBER"),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Enter your card number'),
              ),
              const SizedBox(height: 20),
              const Text("EXPIRED DATE"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'Day'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'Month'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'Year'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text("PASSWORD"),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter your Password',
                ),
              ),

              const SizedBox(height: 20),
              const Text("PHONE NUMBER"),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: '+880'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 4,
                    child: TextFormField(
                      decoration:
                          const InputDecoration(hintText: 'Enter Your Phone Number'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                  child: ElevatedButton(
                      child: const Text('LINK CARD'), onPressed: () {})),
              const SizedBox(height: 20),
              const Text(
                '* Nunc faucibus a pellentesque sit amet porttitor eget dolor morbi non.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const Text(
                '* Nunc faucibus a pellentesque sit amet porttitor eget dolor morbi non.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
