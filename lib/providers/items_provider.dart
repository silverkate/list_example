import 'dart:math';

import 'package:list_example/data/models/item_model.dart';

/// Provider to mock data. The delay is used to show progress.
class ItemProvider {
  final _rnd = Random();

  /// Getting the next item to display. The error is thrown randomly.
  Future<ItemModel?> getNextItem(int index) async {
    await Future.delayed(Duration(seconds: _rnd.nextInt(3)));

    if (_rnd.nextBool()) {
      throw Error();
    }

    return ItemModel(name: 'Item $index');
  }

  /// Deleting the last item.
  Future<void> deleteItem() async {
    await Future.delayed(Duration(seconds: _rnd.nextInt(3)));
  }
}
