
import 'package:flutter/material.dart';

class MusicBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const MusicBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      Icons.home_rounded,
      Icons.explore_rounded,
      Icons.search_rounded,
      Icons.library_music_rounded,
    ];

    final labels = [
      'Home',
      'Feed',
      'Search',
      'Library',
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xFF172526),
        border: Border(
          top: BorderSide(color: Colors.white12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final selected = currentIndex == index;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  items[index],
                  color: selected
                      ? const Color(0xFF35D6B0)
                      : Colors.white54,
                ),
                const SizedBox(height: 4),
                Text(
                  labels[index],
                  style: TextStyle(
                    fontSize: 11,
                    color: selected
                        ? const Color(0xFF35D6B0)
                        : Colors.white54,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
