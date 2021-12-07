import 'package:college_flutter_app/db.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/food_category_form_dialog.dart';
import '../models/food_category.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final List<FoodCategory> categories = [];

  @override
  void initState() {
    _fetchFoodCategoriesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('K3519010 - Food Catalog w/ SQLite'),
        actions: [
          TextButton(
            onPressed: DB().test,
            child: const Text('Test DB'),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchFoodCategoriesData,
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: categories.length,
        itemBuilder: (context, i) {
          final category = categories[i];

          return Dismissible(
            key: Key(category.name),
            child: ListTile(
              title: Text(category.name),
              leading: CircleAvatar(
                child: Text(category.priority.toString()),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _editCategory(category),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              onTap: () => Get.toNamed(
                '/category/${category.id}',
                arguments: category,
              ),
            ),
            onDismissed: (direction) => _onListItemDismissed(i),
          );
        },
        separatorBuilder: (context, i) => Divider(),
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 160),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _editCategory(FoodCategory.create('')),
      ),
    );
  }

  _onListItemDismissed(int i) {
    final category = categories[i];

    setState(() {
      setState(() => categories.removeAt(i));

      category.delete()
        ..then((value) => Get.snackbar(
              'Deleted',
              '\'${category.name}\' category deleted!',
              backgroundColor: Colors.red,
              snackPosition: SnackPosition.BOTTOM,
            ))
        ..onError((error, stackTrace) => Get.snackbar(
              'Error!',
              error.toString(),
              backgroundColor: Colors.red,
              snackPosition: SnackPosition.BOTTOM,
            ));
    });
  }

  _editCategory(FoodCategory foodCategory) {
    Get.dialog<FoodCategory>(
      FoodCategoryFormDialog(foodCategory: foodCategory),
      barrierDismissible: false,
    ).then((v) {
      if (v != null) {
        int i = categories.indexOf(foodCategory);

        foodCategory.save()
          ..then((value) {
            setState(() {
              if (i >= 0)
                categories[i] = v;
              else
                categories.add(v);
            });

            Get.snackbar('Saved!', 'Saved for ${v.id}');
          })
          ..catchError((e) => Get.snackbar('Error!', e.toString()));
      }
    });
  }

  _fetchFoodCategoriesData() async {
    final data = await FoodCategory.getAll();

    setState(() {
      categories.clear();
      categories.addAll(data);
    });

    Get.snackbar('Loaded!', 'Found ${categories.length} categories!');
  }
}

_mockFoodCategories() =>
    List.generate(10, (i) => FoodCategory.create('category#$i'));
