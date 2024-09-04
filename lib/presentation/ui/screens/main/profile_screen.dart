import 'package:e_pay/presentation/ui/screens/main/add_card_screen.dart';
import 'package:e_pay/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/custom_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddCardScreen());
        },
        child: Icon(Icons.navigate_next_outlined),
      ),
      body: Column(
        children: [
          CustomContainer(
            height: MediaQuery.of(context).size.height *
                0.55, // Adjust height as needed
            child: Stack(
              children: [
                const Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 28.0,
                  ),
                ),
                const Positioned(
                  top: 50.0,
                  right: 20.0,
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 28.0,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: 50.0,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "YOUR NAME",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          "your-email@email.com",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white70),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          width: 260,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "BALANCE",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(color: AppColors.themeColor),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                "\$4,180.20",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(color: AppColors.themeColor),
                              ),
                              const SizedBox(height: 10.0),
                              ElevatedButton(
                                  child: const Text('TRANSFER'),
                                  onPressed: () {})
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "LATEST TRANSACTIONS",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColors.themeColor),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const TransactionItem(
                      title: "Lorem Ipsum Company",
                      subtitle: "Received payment",
                      amount: "\$2,030.80",
                    ),
                    const TransactionItem(
                      title: "Auctor Elit Ltd.",
                      subtitle: "Transfer money",
                      amount: "-\$450.00",
                    ),
                    const TransactionItem(
                      title: "Lectus Sit Amet est",
                      subtitle: "Gas & electricity payment",
                      amount: "-\$239.50",
                    ),
                    const TransactionItem(
                      title: "Congue Quisque",
                      subtitle: "Withdraw money",
                      amount: "-\$1,500.00",
                    ),
                    const SizedBox(height: 20.0),
                    // Added spacing to avoid overlap with the "more >>" text
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "more >>",
                        style: TextStyle(
                          color: AppColors.themeColor,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;

  const TransactionItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.blueAccent,
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
