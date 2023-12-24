part of 'basket_cubit.dart';

enum BasketStatus { initial, loading, success, error }

class BasketState extends Equatable {
  const BasketState({
    this.status = BasketStatus.initial,
    this.savedValues = const [],
    this.errorMessage,
  });

  final BasketStatus status;
  final String? errorMessage;
  final List<CombinedList?>? savedValues;

  BasketState copyWith({
    BasketStatus? status,
    String? errorMessage,
    List<CombinedList?>? savedValues,
  }) {
    return BasketState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      savedValues: savedValues ?? this.savedValues,
    );
  }

  @override
  List<Object?> get props => [
        status,
        savedValues,
        errorMessage,
      ];
}
