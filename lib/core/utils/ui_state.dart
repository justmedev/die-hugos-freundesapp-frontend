import "package:flutter/widgets.dart";

sealed class UiState {
  const UiState();

  factory UiState.loading() = Loading;
  factory UiState.error([String? message]) = Error;
  factory UiState.success() = Success;
}

class Loading extends UiState {}

@immutable
class Error extends UiState {
  const Error([this.message]);
  final String? message;

  @override
  bool operator ==(Object other) {
    return other is Error && other.message == message;
  }

  @override
  int get hashCode => super.hashCode + message.hashCode;
}

class Success extends UiState {}
