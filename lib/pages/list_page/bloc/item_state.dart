import 'package:list_example/base/base_state.dart';
import 'package:list_example/data/models/item_model.dart';

/// State when the item is added.
class AddItemState extends BaseState {
  AddItemState(this.item);

  final ItemModel? item;
}

/// State when the item is removed.
class DeleteItemState extends BaseState {}
