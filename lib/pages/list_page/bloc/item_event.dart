import 'package:list_example/base/base_event.dart';

/// Notifies bloc to add another item.
class GetNewItemEvent extends BaseEvent {
  GetNewItemEvent(this.index);

  final int index;
}

/// Notifies bloc to delete item.
class DeleteItemEvent extends BaseEvent {}
