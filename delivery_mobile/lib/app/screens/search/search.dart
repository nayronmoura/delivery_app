import 'package:delivery_mobile/app/core/colors.dart';
import 'package:delivery_mobile/app/widgets/gradient_widget.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        title: const Column(
          children: [
            TextField(
                autofocus: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 1)))),
          ],
        ),
      ),
      body: const GradientWidget(
        child: Center(child: Text('Search')),
      ),
    );
  }
}
