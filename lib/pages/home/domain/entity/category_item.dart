import 'package:flutter/widgets.dart';

class CategoryItem {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  CategoryItem({required this.title, required this.icon, this.onTap});
}
