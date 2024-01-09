import 'package:flutter/material.dart';
import '../models/category_model.dart';

import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key
  });

  final List<CategoryModel> categories = const [
    CategoryModel(
      image: 'assets/business.jpeg',
      categoryName: 'Business',
    ),
    CategoryModel(
      image: 'assets/entertainment.png',
      categoryName: 'Entertainment',
    ),
    CategoryModel(
      image: 'assets/health.png',
      categoryName: 'Health',
    ),
    CategoryModel(
      image: 'assets/science.jpeg',
      categoryName: 'Science',
    ),
    CategoryModel(
      image: 'assets/technology.jpeg',
      categoryName: 'Technology',
    ),
    CategoryModel(
      image: 'assets/sports.jpeg',
      categoryName: 'Sports',
    ),
    CategoryModel(
      image: 'assets/general.png',
      categoryName: 'General',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length ,
        itemBuilder: (context, index) {
          return CategoryCard(
            category:categories[index],
          );
        },
      ),
    );

  }
}
