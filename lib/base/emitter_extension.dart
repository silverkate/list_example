import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_example/base/base_state.dart';

extension EmitterExt on Emitter {
  void streamAsync(Stream<BaseState> stream) =>
      forEach<BaseState>(stream, onData: (state) => state);
}
