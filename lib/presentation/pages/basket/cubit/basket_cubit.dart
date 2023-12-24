import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_case_umitmutluu/core/helpers/db_helper.dart';
import 'package:flutter_case_umitmutluu/data/models/home_model.dart';
import 'package:flutter_case_umitmutluu/domain/entities/home_entity.dart';

part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  BasketCubit() : super(const BasketState());

  Future<void> getAllStorage() async {
    emit(state.copyWith(status: BasketStatus.loading));
    List<CombinedList> storedValues = [];
    await DBHelper.instance.getAllModel().then((list) {
      storedValues = list;
    });
    if (storedValues.isNotEmpty) {
      emit(state.copyWith(
          status: BasketStatus.success, savedValues: storedValues));
    } else {
      emit(
          state.copyWith(status: BasketStatus.error, errorMessage: 'No Image'));
    }
  }

  Future<void> deleteAllValue() async {
    emit(state.copyWith(status: BasketStatus.loading));
    await DBHelper.instance.deleteAllModels();
    emit(state.copyWith(status: BasketStatus.success, savedValues: [],errorMessage: 'No Image'));
  }

  void saveStorage(CombinedEntity entity) {
    emit(state.copyWith(status: BasketStatus.loading));

    DBHelper.instance.saveModel(
      CombinedList(
        type: entity.type,
        name: entity.name,
        imageUrl: entity.imageUrl,
        explanation: entity.explanation,
      ),
    );
    getAllStorage();
    emit(state.copyWith(status: BasketStatus.success));

  }

  void removeStorage(int id) {
    DBHelper.instance.deleteModelFromId(id);
  }
}
