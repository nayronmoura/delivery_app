import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductWidget extends StatelessWidget {
  final String productName;
  final double price;
  final String? image;
  const ProductWidget(
      {super.key, required this.productName, required this.price, this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/product', extra: 1);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 100,
              width: 100,
              child: image != null
                  ? Image.network('https://via.placeholder.com/150')
                  : const Center(
                      child: Icon(
                        Icons.image,
                        size: 30,
                        color: Colors.white,
                      ),
                    )),
          Text(productName, style: const TextStyle(color: Colors.white)),
          Text(r'R$ ' + price.toString(),
              style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
