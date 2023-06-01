import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_example/base/base_state.dart';

/// Extension to emit events in another way.
extension EmitterExt on Emitter {
  /// Provides an opportunity to emit stream of events.
  void streamAsync(Stream<BaseState> stream) =>
      forEach<BaseState>(stream, onData: (state) => state);
}
