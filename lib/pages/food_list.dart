import 'package:college_flutter_app/components/food_form_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/food.dart';
import '../models/food_category.dart';

class FoodList extends StatefulWidget {
  const FoodList({Key? key}) : super(key: key);

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  FoodCategory? category;
  final List<Food> foods = [];

  @override
  void initState() {
    _setCategory(() => setState(() {
          category = Get.arguments;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(category?.name ?? '[Food Name]'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchFoodsData,
          ),
        ],
      ),
      body: category == null
          ? const Center(child: Text('404'))
          : ListView.separated(
              itemCount: foods.length,
              itemBuilder: (context, i) {
                final food = foods[i];
                const textBoldStyle = TextStyle(fontWeight: FontWeight.w600);
                const textNormalStyle =
                    TextStyle(fontWeight: FontWeight.normal);

                return Dismissible(
                  key: Key(food.id == 0 ? food.name : food.id.toString()),
                  child: ListTile(
                    title: Text(food.name),
                    subtitle: RichText(
                      text: TextSpan(
                        text: 'Qty: ',
                        style: theme.textTheme.caption!.merge(textBoldStyle),
                        children: [
                          TextSpan(
                            text: '${food.qty}${food.unit}',
                            style: textNormalStyle,
                          ),
                          TextSpan(text: ' | Note: '),
                          TextSpan(
                            text: '${food.note.isEmpty ? '-' : food.note}',
                            style: textNormalStyle,
                          ),
                        ],
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _editFood(food),
                    ),
                    onTap: () {},
                  ),
                  onDismissed: (direction) => _onListItemDismissed(i),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 160),
            ),
      floatingActionButton: category == null
          ? null
          : FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => _editFood(Food.create(category!.id, '')),
            ),
    );
  }

  _onListItemDismissed(int i) {
    final food = foods[i];

    setState(() {
      setState(() => foods.removeAt(i));

      food.delete()
        ..then((value) => Get.snackbar(
              'Deleted',
              '\'${food.name}\' deleted!',
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

  _editFood(Food food) {
    Get.dialog<Food?>(
      FoodFormDialog(food: food),
      barrierDismissible: false,
    ).then((v) {
      if (v != null) {
        int i = foods.indexOf(food);

        food.save()
          ..then((value) {
            setState(() {
              if (i >= 0)
                foods[i] = v;
              else
                foods.add(v);
            });

            Get.snackbar('Saved!', 'Saved for ${v.id}');
          })
          ..catchError((e) => Get.snackbar('Error!', e.toString()));
      }
    });
  }

  _fetchFoodsData() async {
    if (category == null) return;

    final foods = category == null
        ? await Food.getAll()
        : await Food.getAllByCategory(category!.id);

    setState(() {
      this.foods.clear();
      this.foods.addAll(foods);
    });

    Get.snackbar('Loaded!', 'Found ${foods.length} foods!');
  }

  _watchCategory(FoodCategory? newVal, FoodCategory? oldVal) {
    _fetchFoodsData();
  }

  _setCategory(VoidCallback setter) {
    final oldVal = category;
    setter();
    final newVal = category;
    _watchCategory(newVal, oldVal);
  }
}

_mockFoods(int categoryId) => List.generate(
    10, (i) => Food.create(categoryId, 'food#$i in #$categoryId'));
