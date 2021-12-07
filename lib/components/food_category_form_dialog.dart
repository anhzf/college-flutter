import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/food_category.dart';

class FoodCategoryFormDialog extends StatefulWidget {
  const FoodCategoryFormDialog({
    Key? key,
    required this.foodCategory,
  }) : super(key: key);

  final FoodCategory foodCategory;

  @override
  _FoodCategoryFormDialogState createState() =>
      _FoodCategoryFormDialogState(foodCategory);
}

class _FoodCategoryFormDialogState extends State<FoodCategoryFormDialog> {
  _FoodCategoryFormDialogState(this.foodCategory)
      : nameController = TextEditingController(text: foodCategory.name);

  final FoodCategory foodCategory;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categoryNameInput = TextField(
      controller: nameController,
      decoration: const InputDecoration(
        labelText: 'Name',
      ),
    );
    final categoryPriorityInput = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Priority scale', style: theme.textTheme.caption),
        Slider(
          value: foodCategory.priority.toDouble(),
          label: foodCategory.priority.toString(),
          min: FoodCategory.PRIORITY_MIN.toDouble(),
          max: FoodCategory.PRIORITY_MAX.toDouble(),
          divisions: FoodCategory.PRIORITY_MAX - FoodCategory.PRIORITY_MIN,
          onChanged: (v) => setState(() {
            foodCategory.priority = v.round();
          }),
        )
      ],
    );

    return AlertDialog(
      title: Text(foodCategory.name.isEmpty ? 'Add Category' : 'Edit Category'),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              categoryNameInput,
              const SizedBox(height: 16),
              categoryPriorityInput,
              const SizedBox(height: 32),
              Text('ID: ${foodCategory.id}', style: theme.textTheme.caption),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: Get.back,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(elevation: 0),
          onPressed: () {
            foodCategory.name = categoryNameInput.controller!.text;

            Get.back(result: foodCategory);
          },
          child: const Text('Save'),
        )
      ],
    );
  }
}
