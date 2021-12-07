import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/food_category_list.dart';
import 'pages/food_list.dart';

void main() async {
  runApp(
    GetMaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const CategoryList(),
        ),
        GetPage(
          name: '/category/:id',
          page: () => const FoodList(),
        ),
      ],
    ),
  );
}
