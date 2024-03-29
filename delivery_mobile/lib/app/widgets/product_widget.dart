import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductWidget extends StatefulWidget {
  final String productName;
  final double productPrice;
  const ProductWidget(
      {super.key, required this.productName, required this.productPrice});

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
          Text(
            widget.productName,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text('R\$' + widget.productPrice.toStringAsFixed(2),
              style: const TextStyle(
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
