import 'package:delivery_mobile/app/core/colors.dart';
import 'package:delivery_mobile/app/widgets/carousel_widget.dart';
import 'package:delivery_mobile/app/widgets/category_section/category_item.dart';
import 'package:delivery_mobile/app/widgets/category_section/category_section_widget.dart';
import 'package:delivery_mobile/app/widgets/gradient_widget.dart';
import 'package:delivery_mobile/app/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        actions: [
          InkWell(
              onTap: () => context.push('/search'),
              child: const Icon(Icons.search, color: Colors.white))
        ],
      ),
      body: GradientWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CarouselWidget(
                images: [
                  "https://i0.wp.com/jornal.usp.br/wp-content/uploads/2020/07/20200720_food_delivery.jpg?resize=1200%2C630&ssl=1",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5Q0BjFkK7LMzVZORNqFnzl7YBTJqxyJiEWRNIE2toVjGbxrTOqB02qjlWH9MS23UnbsQ&usqp=CAU",
                  'https://via.placeholder.com/300',
                ],
              ),
              const Divider(color: Colors.white, thickness: 1),
              CategoryWidget(
                categorys: List.generate(
                    4,
                    (index) => CategoryItem(
                        icon: const Icon(Icons.fastfood, color: Colors.white),
                        text: 'Category $index')),
              ),
              const Divider(color: Colors.white, thickness: 1),
              Wrap(
                  spacing: 30,
                  runSpacing: 10,
                  children: List.generate(10, (index) => const ProductWidget()))
            ],
          ),
        ),
      ),
    );
  }
}
