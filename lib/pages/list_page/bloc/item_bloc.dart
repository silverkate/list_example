import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_example/base/base_event.dart';
import 'package:list_example/base/base_state.dart';
import 'package:list_example/base/emitter_extension.dart';
import 'package:list_example/pages/list_page/bloc/item_event.dart';
import 'package:list_example/pages/list_page/bloc/item_state.dart';
import 'package:list_example/providers/items_provider.dart';

class ItemBloc extends Bloc<BaseEvent, BaseState> {
  ItemBloc() : super(InitState()) {
    on<GetNewItemEvent>((event, emit) => emit.futureAsync(_getNewItem(event)));
    on<DeleteItemEvent>((event, emit) => emit(_deleteItem()));
  }

  final _itemProvider = ItemProvider();

  Future<BaseState> _getNewItem(GetNewItemEvent event) async {
    try {
      final item = await _itemProvider.getNextItem(event.index);

      return AddItemState(item);
    } catch (e) {
      return ErrorState('This is a mocked error.');
    }
  }

  BaseState _deleteItem() {
    return DeleteItemState();
  }
}
