/// Base state that is processed by bloc.
abstract class BaseState {}

/// The initial state of the app.
class InitState extends BaseState {}

/// The error state.
class ErrorState extends BaseState {
  ErrorState(this.error);

  final String error;
}

/// The progress state when the progress should be displayed on the screen.
class ProgressState extends BaseState {}
