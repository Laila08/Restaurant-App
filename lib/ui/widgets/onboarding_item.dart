import 'package:flutter/material.dart';
import '../screens/register_screen.dart';
import 'custom_indicator.dart';
import '../screens/home.dart';

class OnboardingItem extends StatefulWidget {
  final String image;
  final int pageIndex;
  final bool isActive;
  final PageController controller;

  const OnboardingItem({
    super.key,
    required this.image,
    required this.pageIndex,
    required this.isActive,
    required this.controller,
  });

  @override
  State<OnboardingItem> createState() => _OnboardingItemState();
}

class _OnboardingItemState extends State<OnboardingItem> {

  @override
  void initState() {
    super.initState();

    if (widget.pageIndex == 2) {
      initFun();
    }
  }

  Future<void> initFun() async {
    await Future.delayed(const Duration(seconds: 4));
    if (!mounted) return;

    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) =>  RegisterScreen(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          widget.image,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 50,
          left: 50,
          right: 50,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              color: const Color(0xFFFE8C00),
            ),
            child: Column(
              children: [
                const Text(
                  'We serve \nincomparable \ndelicacies',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'All the best restaurants with their top \nmenu waiting for you, they cant’t wait \nfor your order!!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.5,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIndicator(active: widget.pageIndex == 0),
                    const SizedBox(width: 3),
                    CustomIndicator(active: widget.pageIndex == 1),
                    const SizedBox(width: 3),
                    CustomIndicator(active: widget.pageIndex == 2),
                  ],
                ),
                widget.pageIndex != 2
                    ? Padding(
                  padding: const EdgeInsets.only(
                      top: 60, bottom: 10, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Skip',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                      InkWell(
                        onTap: () {
                          widget.controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: const Row(
                          children: [
                            Text(
                              'Next ',
                              style: TextStyle(fontSize: 13, color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 14,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
                    : Column(
                  children: [
                    const SizedBox(height: 25),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const SizedBox(
                          height: 95,
                          width: 95,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: 65,
                          height: 65,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward),
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => RegisterScreen(),
                              //   ),
                              // );
                            },
                            color: const Color(0xFFFE8C00),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
