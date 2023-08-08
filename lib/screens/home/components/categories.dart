import 'package:flutter/material.dart';
import 'package:furniture_app/models/Categories.dart';

import 'category_card.dart';


/// ... In this class we print the list of 'categories' in CategoryCard' structure

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;        // This is the categories list having all the categories from API

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
              categories.length,   //length of the list
              // 'categories - indexWise" passing data to each CategoryCard to generate a category
                  (index) => CategoryCard(category: categories[index])  // these categories are coming from 'category_card.dart' file
          )
      ),
    );
  }
}