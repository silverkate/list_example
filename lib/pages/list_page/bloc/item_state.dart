import 'package:list_example/base/base_state.dart';
import 'package:list_example/data/models/item_model.dart';

class AddItemState extends BaseState {
  AddItemState(this.item);

  final ItemModel? item;
}

class DeleteItemState extends BaseState {}
