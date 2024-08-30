import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;
  final Color unselectedColor;
  final TextStyle? textStyle;

  CategoryChip({
    required this.label,
    this.isSelected = false,
    required this.onTap,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.grey,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        label,
        style: textStyle ?? TextStyle(color: Colors.white),
      ),
      selected: isSelected,
      onSelected: (_) => onTap(),
      selectedColor: selectedColor,
      backgroundColor: unselectedColor,
    );
  }
}
