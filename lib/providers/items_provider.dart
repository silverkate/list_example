import 'dart:math';

import 'package:list_example/data/models/item_model.dart';

/// Provider to mock data.
class ItemProvider {
  Future<ItemModel?> getNextItem(int index) async {
    final rnd = Random();

    if (rnd.nextBool()) {
      throw Error();
    }

    return ItemModel(name: 'Item $index');
  }
}
