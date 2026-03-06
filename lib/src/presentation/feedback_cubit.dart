import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/suggestions_repository.dart';

enum FeedbackStatus { initial, submitting, success, error }

class FeedbackState extends Equatable {
  const FeedbackState({
    this.status = FeedbackStatus.initial,
    this.errorMessage,
  });

  final FeedbackStatus status;
  final String? errorMessage;

  FeedbackState copyWith({FeedbackStatus? status, String? errorMessage}) {
    return FeedbackState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}

class FeedbackCubit extends Cubit<FeedbackState> {
  FeedbackCubit({required SuggestionsRepository repository})
      : _repository = repository,
        super(const FeedbackState());

  final SuggestionsRepository _repository;

  Future<void> sendSuggestion({
    required String type,
    required String text,
    String? email,
  }) async {
    emit(state.copyWith(status: FeedbackStatus.submitting, errorMessage: null));
    try {
      await _repository.addSuggestion(type: type, text: text, email: email);
      emit(state.copyWith(status: FeedbackStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: FeedbackStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}

