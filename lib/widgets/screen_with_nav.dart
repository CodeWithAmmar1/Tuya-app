import 'package:app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ScreenWithNav extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final Function(int) onNavTap;

  const ScreenWithNav({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.onNavTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: child),
            BottomNavBar(
              currentIndex: currentIndex,
              onTap: onNavTap,
            ),
          ],
        ),
      ),
    );
  }
}
