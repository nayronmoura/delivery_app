import 'package:delivery_mobile/app/core/colors.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  final List<String> images;
  const CarouselWidget({super.key, required this.images});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Image.network(
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
                widget.images[index],
                fit: BoxFit.cover,
              );
            },
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.images.length, (index) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? AppColors.secondary
                          : AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ))
        ],
      ),
    );
  }
}
