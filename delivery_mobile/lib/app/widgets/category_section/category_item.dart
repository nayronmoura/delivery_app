import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final Widget icon;
  final String text;
  final bool isSelected;
  final String id;
  final Function(String)? onTap;
  const CategoryItem(
      {super.key,
      required this.icon,
      required this.text,
      required this.id,
      this.onTap,
      this.isSelected = false});

  changeSelection(bool isSelected) {
    return CategoryItem(
        icon: icon, text: text, id: id, onTap: onTap, isSelected: isSelected);
  }

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onTap != null) widget.onTap!(widget.id);
      },
      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: widget.isSelected ? Colors.red : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.icon,
            Text(widget.text, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
