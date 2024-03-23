import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
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
              child: Image.network('https://via.placeholder.com/150')),
          const Text('Product name', style: TextStyle(color: Colors.white)),
          const Text(r'R$ 20', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
