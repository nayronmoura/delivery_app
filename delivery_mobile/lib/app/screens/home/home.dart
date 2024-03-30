import 'package:delivery_mobile/app/core/colors.dart';
import 'package:delivery_mobile/app/core/injects.dart';
import 'package:delivery_mobile/app/models/product_model.dart';
import 'package:delivery_mobile/app/screens/home/home_store.dart';
import 'package:delivery_mobile/app/services/product_service.dart';
import 'package:delivery_mobile/app/widgets/carousel_widget.dart';
import 'package:delivery_mobile/app/widgets/category_section/category_item.dart';
import 'package:delivery_mobile/app/widgets/category_section/category_section_widget.dart';
import 'package:delivery_mobile/app/widgets/gradient_widget.dart';
import 'package:delivery_mobile/app/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
      create: (context) => HomeStore(getIt<ProductService>()),
      child: const Home(),
    );
  }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeStore _store;

  @override
  void initState() {
    _store = context.read<HomeStore>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _store.fetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _store = context.watch<HomeStore>();

    if (_store.state.isLoading) {
      return const Scaffold(
        body: GradientWidget(
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ),
      );
    } else if (_store.state.isError) {
      return const Scaffold(
        body: GradientWidget(
          child: Center(
            child: Text('Error'),
          ),
        ),
      );
    } else {
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
                    categorys: ProductCategory.values
                        .map((category) => CategoryItem(
                              id: category.name,
                              isSelected:
                                  _store.categorySelected == category.name,
                              icon: Icon(category.icon, color: Colors.white),
                              onTap: (id) {
                                if (_store.categorySelected == id) {
                                  _store.setCategorySelected(null);
                                  return;
                                }
                                _store.setCategorySelected(id);
                              },
                              text: category.name,
                            ))
                        .toList()),
                const Divider(color: Colors.white, thickness: 1),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                        spacing: 30,
                        runSpacing: 10,
                        children: _store.products
                            .map((product) => ProductWidget(
                                productName: product.name,
                                price: product.price,
                                image: product.image))
                            .toList()),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
