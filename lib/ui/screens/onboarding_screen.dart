import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/onboarding_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  int index = 0;

  final List<String> images = [
    'assets/images/WhatsApp Image 2025-07-22 at 11.53.49_a5b38956.jpg',
    'assets/images/WhatsApp Image 2025-07-22 at 11.53.49_3a1e2680.jpg',
    'assets/images/WhatsApp Image 2025-07-22 at 11.53.50_c974d276.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: pageController,
          onPageChanged: (value) => setState(() {
            index = value;
          }),
          itemCount: images.length,
          itemBuilder: (context, i) => OnboardingItem(
            key: ValueKey(i),
            controller: pageController,
            image: images[i],
            pageIndex: i,
            isActive: i == index,
          ),
        ),
      ),
    );
  }
}
