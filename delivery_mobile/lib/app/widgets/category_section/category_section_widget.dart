import 'package:delivery_mobile/app/widgets/category_section/category_item.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  final List<CategoryItem> categorys;
  final String? firstSelected;

  const CategoryWidget(
      {super.key, required this.categorys, this.firstSelected});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  final PageController _pageController =
      PageController(keepPage: true, viewportFraction: 0.3);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        padEnds: false,
        controller: _pageController,
        itemCount: widget.categorys.length,
        itemBuilder: (context, index) {
          return widget.categorys[index];
        },
      ),
    );
  }
}
