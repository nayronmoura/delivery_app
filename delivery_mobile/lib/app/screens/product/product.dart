import 'package:delivery_mobile/app/core/colors.dart';
import 'package:delivery_mobile/app/screens/product/product_store.dart';
import 'package:delivery_mobile/app/widgets/carousel_widget.dart';
import 'package:delivery_mobile/app/widgets/gradient_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Product extends StatefulWidget {
  final int id;
  const Product({super.key, required this.id});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final store = ProductStore();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      store.fetchProduct();
    });
    super.initState();
  }

  void emitSnackbar() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product added to cart'),
        ),
      );
      context.pop();
    });
  }

  int countToBy = 1;
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store,
      builder: (context, child) {
        if (store.status.isLoading) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else if (store.status.isContent || store.status.isAddedToCart) {
          if (store.status.isAddedToCart) {
            emitSnackbar();
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.secondary,
            ),
            body: const GradientWidget(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: CarouselWidget(
                        images: [
                          'https://via.placeholder.com/500',
                          'https://via.placeholder.com/500',
                          'https://via.placeholder.com/500',
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Product name',
                            textScaler: TextScaler.linear(1),
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                        Divider(color: Colors.white, thickness: 1),
                        Text(
                            r'Pizza Margherita - Feita com ingredientes frescos e de alta qualidade, nossa Pizza Margherita é uma das favoritas dos clientes. Coberta com molho de tomate caseiro, mussarela fresca e manjericão, esta pizza é uma delícia. Entregamos quente e fresco na sua porta',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (countToBy > 1) {
                            store.removeProduct();
                          }
                        },
                      ),
                      Text('${store.productCount}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: AppColors.text)),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          store.addProduct();
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        store.addToCart();
                      },
                      child: const Text('Add to cart'))
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
