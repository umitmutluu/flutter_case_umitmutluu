import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_case_umitmutluu/core/helpers/db_helper.dart';
import 'package:flutter_case_umitmutluu/data/models/home_model.dart';
import 'package:flutter_case_umitmutluu/domain/entities/home_entity.dart';
import 'package:flutter_case_umitmutluu/domain/usecases/home_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeUseCase) : super(const HomeState());
  final HomeUseCase homeUseCase;
  final selectedItemse = <Map<CombinedEntity,bool>>[];

  Future<void> getHomeModels() async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final homeData = await homeUseCase.getHomeDataUseCase();
      selectedItemse.addAll(homeData!.combinedEntity.map((e) => {e:false}));
      emit(
        state.copyWith(
          status: HomeStatus.success,
          homeDatas: homeData,
          isAddedValues: selectedItemse,
        ),
      );
    } catch (e) {
      emit(
          state.copyWith(status: HomeStatus.error, errorMessage: e.toString()));
      throw Exception(e);
    }
  }

  void addItem(int index) {
    emit(state.copyWith(status: HomeStatus.loading));
    selectedItemse[index][selectedItemse[index].keys.first] = true;

    emit(state.copyWith(
        isAddedValues: selectedItemse, status: HomeStatus.success));
  }

  void removeItem(int index) {
    emit(state.copyWith(status: HomeStatus.loading));
    selectedItemse[index][selectedItemse[index].keys.first] = false;

    emit(state.copyWith(
        isAddedValues: selectedItemse, status: HomeStatus.success));
  }

  Future<void> getStoredValues() async {
    List<CombinedList> storedImage = [];
    await DBHelper.instance.getAllModel().then((list) {
      storedImage = list;
    });
    if (storedImage.isNotEmpty) {
      emit(
          state.copyWith(status: HomeStatus.success, addedValues: storedImage));
    }
  }


}
