import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class AppData with ChangeNotifier {
  Color _selectedColor = Colors.black;
  Color get selectedColor => _selectedColor;

  // App status
  bool isSidebarLeftVisible = false;
  bool isSidebarRightVisible = false;

  // Toggle sidebar left
  void toggleSidebarLeft() {
    isSidebarLeftVisible = !isSidebarLeftVisible;
    notifyListeners();
  }

  // Toggle sidebar right
  void toggleSidebarRight() {
    isSidebarRightVisible = !isSidebarRightVisible;
    notifyListeners();
  }

  void setSelectedColor(Color color) {
    _selectedColor = color;
    notifyListeners(); // Esto notifica a los widgets que dependen de AppData que deben actualizarse.
  }
}
