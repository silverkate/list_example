import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_example/base/base_state.dart';

extension EmitterExt on Emitter {
  void futureAsync(Future<BaseState> future) =>
      future.then((state) => this(state));
}
