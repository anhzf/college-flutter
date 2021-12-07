import 'package:college_flutter_app/models/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FoodFormDialog extends StatefulWidget {
  const FoodFormDialog({
    Key? key,
    required this.food,
  }) : super(key: key);

  final Food food;

  @override
  _FoodFormDialogState createState() => _FoodFormDialogState(food);
}

class _FoodFormDialogState extends State<FoodFormDialog> {
  _FoodFormDialogState(this.food)
      : nameController = TextEditingController(text: food.name),
        qtyController = TextEditingController(text: food.qty.toString()),
        noteController = TextEditingController(text: food.note),
        unitController = TextEditingController(text: food.unit);

  final Food food;
  final TextEditingController nameController;
  final TextEditingController qtyController;
  final TextEditingController noteController;
  final TextEditingController unitController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final nameInput = TextField(
      controller: nameController,
      decoration: const InputDecoration(
        labelText: 'Name',
      ),
    );
    final qtyInput = Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: TextField(
            controller: qtyController,
            decoration: const InputDecoration(
              labelText: 'Quantity',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
        IconButton(
          iconSize: 16,
          icon: Icon(Icons.remove),
          onPressed: () {
            qtyController.text = (int.parse(qtyController.text) - 1).toString();
          },
        ),
        IconButton(
          iconSize: 16,
          icon: Icon(Icons.add),
          onPressed: () {
            qtyController.text = (int.parse(qtyController.text) + 1).toString();
          },
        ),
      ],
    );
    final unitInput = TextField(
      controller: unitController,
      decoration: const InputDecoration(
        labelText: 'Unit (kilograms, grams, liter, etc.)',
      ),
    );
    final noteInput = TextField(
      controller: noteController,
      decoration: const InputDecoration(
        labelText: 'Notes',
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,
    );

    return AlertDialog(
      title: Text(food.name.isEmpty ? 'Add Food' : 'Edit Food'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            nameInput,
            qtyInput,
            unitInput,
            noteInput,
            const SizedBox(height: 32),
            Text('ID: ${food.id}', style: theme.textTheme.caption),
          ],
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
            food.name = nameController.text;
            food.qty = int.parse(qtyController.text);
            food.unit = unitController.text;
            food.note = noteController.text;

            Get.back(result: food);
          },
          child: const Text('Save'),
        )
      ],
    );
  }
}
