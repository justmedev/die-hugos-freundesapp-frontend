sealed class UiState {
  const UiState();

  factory UiState.loading() = Loading;
  factory UiState.error([String? message]) = Error;
  factory UiState.success() = Success;
}

class Loading extends UiState {}

class Error extends UiState {
  Error([this.message]);
  final String? message;
}

class Success extends UiState {}
