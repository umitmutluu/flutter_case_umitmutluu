import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_case_umitmutluu/domain/entities/home_entity.dart';
import 'package:flutter_case_umitmutluu/presentation/pages/basket/cubit/basket_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../core/helper/db_helper_test.dart';

void main() {
  group('BasketCubit', () {
    late BasketCubit basketCubit;

    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();

      PathProviderPlatform.instance = FakePathProviderPlatform();
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      basketCubit = BasketCubit();
    });

    tearDown(() {
      basketCubit.close();
    });
    blocTest(
      'emits [BasketStatus.loading, BasketStatus.success] when saveStorage is called',
      build: () => basketCubit,
      act: (cubit) async {
        cubit.saveStorage(CombinedEntity(
          type: 'type',
          name: 'name',
          imageUrl: 'imageUrl',
          explanation: 'explanation',
        ));
        // cubit.deleteAllValue();
      },
      expect: () => [
        const BasketState(status: BasketStatus.loading, savedValues: []),
        const BasketState(status: BasketStatus.success, savedValues: []),
      ],
    );
    blocTest(
      'emits [BasketStatus.loading, BasketStatus.success] when deleteAllValue is called',
      build: () => basketCubit,
      act: (cubit) async {
        await cubit.deleteAllValue();
      },
      expect: () => [
        const BasketState(status: BasketStatus.loading),
        const BasketState(status: BasketStatus.success, savedValues: [],errorMessage: 'No Image'),
      ],
    );
    blocTest(
      'emits [BasketStatus.loading, BasketStatus.error, No Image] when getAllStorage is called',
      build: () => basketCubit,
      act: (cubit) async {
        await cubit.getAllStorage();
      },
      expect: () => [
        const BasketState(status: BasketStatus.loading),
        const BasketState(
            status: BasketStatus.error,
            savedValues: [],
            errorMessage: 'No Image'),
      ],
    );



    blocTest(
      'does not emit any new states when removeStorage is called',
      build: () => basketCubit,
      act: (cubit) async {
        cubit.removeStorage(1);
      },
      expect: () => [],
    );
  });
}
