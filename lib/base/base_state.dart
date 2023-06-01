abstract class BaseState {}

class InitState extends BaseState {}

class ErrorState extends BaseState {
  ErrorState(this.error);

  final String error;
}

class ProgressState extends BaseState {}
