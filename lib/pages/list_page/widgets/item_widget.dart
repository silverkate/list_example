import 'package:flutter/material.dart';
import 'package:list_example/data/models/item_model.dart';

/// Single item of the GridView on the [ListPage].
class ItemWidget extends StatelessWidget {
  const ItemWidget({
    required this.item,
    Key? key,
  }) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 3,
        ),
      ),
      child: Center(
        child: Text(
          item.name,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
