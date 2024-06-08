import 'package:flutter/material.dart';

BottomNavigationBarItem buildBottomNavigationBarItem(
    IconData icon, String label) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: InkResponse(
        splashColor: Colors.black.withOpacity(0.2),
        highlightColor: Colors.black.withOpacity(0.1),
        radius: 24,
        onTap: () {},
        child: Icon(icon, color: Colors.black),
      ),
    ),
    label: label,
  );
}
