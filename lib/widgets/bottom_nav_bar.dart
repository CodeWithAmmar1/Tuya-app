import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.home_outlined,
              color: currentIndex == 0 ? Colors.white : Colors.grey,
            ),
            onPressed: () => onTap(0),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: currentIndex == 1 ? Colors.white : Colors.grey,
            ),
            onPressed: () => onTap(1),
          ),
          IconButton(
            icon: Icon(
              Icons.grid_view,
              color: currentIndex == 2 ? Colors.white : Colors.grey,
            ),
            onPressed: () => onTap(2),
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: currentIndex == 3 ? Colors.white : Colors.grey,
            ),
            onPressed: () => onTap(3),
          ),
        ],
      ),
    );
  }
}
