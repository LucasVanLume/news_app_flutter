import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/app_theme.dart';

class BottomNavBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final int index;
  final bool isActive;
  final Function() onTap;
  const BottomNavBar(
      {super.key,
      required this.text,
      required this.isActive,
      required this.icon,
      required this.index,
      required this.onTap
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.iconNavBar.withOpacity(0.15) : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 25,
              color: isActive ? Theme.of(context).primaryColor : AppTheme.iconNavBar,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: isActive ? 8 : 0,
              height: 1,
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: isActive ? Theme.of(context).primaryColor : AppTheme.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}