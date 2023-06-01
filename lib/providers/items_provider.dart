import 'package:list_example/data/models/item_model.dart';

/// Provider to mock data.
class ItemProvider {
  Future<ItemModel?> getNextItem(int index) async {
    return ItemModel(name: 'Item $index');
  }
}