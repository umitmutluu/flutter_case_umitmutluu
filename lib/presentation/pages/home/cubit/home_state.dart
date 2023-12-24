part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, error }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.homeDatas,
    this.errorMessage,
    this.isAddedValues = const [],
  });

  final HomeStatus status;
  final HomeEntity? homeDatas;
  final String? errorMessage;
  final List<Map<CombinedEntity, bool>> isAddedValues;

  HomeState copyWith({
    HomeStatus? status,
    HomeEntity? homeDatas,
    List<CombinedList?>? addedValues,
    String? errorMessage,
    List<Map<CombinedEntity, bool>>? isAddedValues,
  }) {
    return HomeState(
      status: status ?? this.status,
      homeDatas: homeDatas ?? this.homeDatas,
      errorMessage: errorMessage ?? this.errorMessage,
      isAddedValues: isAddedValues ?? this.isAddedValues,
    );
  }

  @override
  List<Object?> get props => [
        status,
        homeDatas,
        errorMessage,
      ];
}
