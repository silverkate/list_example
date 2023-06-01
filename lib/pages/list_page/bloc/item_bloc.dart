import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_example/base/base_event.dart';
import 'package:list_example/base/base_state.dart';
import 'package:list_example/base/emitter_extension.dart';
import 'package:list_example/pages/list_page/bloc/item_event.dart';
import 'package:list_example/pages/list_page/bloc/item_state.dart';
import 'package:list_example/providers/items_provider.dart';

class ItemBloc extends Bloc<BaseEvent, BaseState> {
  ItemBloc() : super(InitState()) {
    on<GetNewItemEvent>((event, emit) => emit.streamAsync(_getNewItem(event)));
    on<DeleteItemEvent>((event, emit) => emit.streamAsync(_deleteItem()));
  }

  final _itemProvider = ItemProvider();

  Stream<BaseState> _getNewItem(GetNewItemEvent event) async* {
    yield ProgressState();

    try {
      final item = await _itemProvider.getNextItem(event.index);

      yield AddItemState(item);
    } catch (e) {
      yield ErrorState('This is a mocked error.');
    }
  }

  Stream<BaseState> _deleteItem() async* {
    yield ProgressState();

    try {
      yield DeleteItemState();
    } catch (e) {
      yield ErrorState('This is a mocked error.');
    }
  }
}
