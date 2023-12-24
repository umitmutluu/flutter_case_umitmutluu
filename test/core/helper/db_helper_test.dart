import 'package:flutter_case_umitmutluu/core/helpers/db_helper.dart';
import 'package:flutter_case_umitmutluu/data/models/home_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
const String kApplicationDocumentsPath = 'applicationDocumentsPath';

void main() {
  late DBHelper dbHelper;

  group('DBHelper Tests', () {

    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();

      PathProviderPlatform.instance = FakePathProviderPlatform();
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;

      dbHelper = DBHelper.instance;
    });

    test('Save and Retrieve Model Test', () async {
      CombinedList exampleModel = CombinedList(

      );

      int savedId = await dbHelper.saveModel(exampleModel);

      CombinedList? retrievedModel = await dbHelper.getModel(savedId);

      expect(retrievedModel, isNotNull);
      expect(retrievedModel!.id, equals(savedId));
    });

    test('Get All Models Test', () async {
      List<CombinedList> initialModels = await dbHelper.getAllModel();
      List<CombinedList> allModels = await dbHelper.getAllModel();
      expect(allModels.length, greaterThanOrEqualTo(initialModels.length));
    });


    test('Delete Model Test', () async {
      CombinedList exampleModel = CombinedList(
      );

      int savedId = await dbHelper.saveModel(exampleModel);

      int deletedCount = await dbHelper.deleteModelFromId(savedId);

      expect(deletedCount, equals(1));

      CombinedList? retrievedModel = await dbHelper.getModel(savedId);
      expect(retrievedModel, isNull);
    });

    test('Delete All Models Test', () async {
      List<CombinedList> initialModels = await dbHelper.getAllModel();
      int deletedAllCount = await dbHelper.deleteAllModels();
      expect(deletedAllCount, greaterThanOrEqualTo(initialModels.length));
      List<CombinedList> allModels = await dbHelper.getAllModel();
      expect(allModels, isEmpty);
    });
  });
}

class FakePathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {

  @override
  Future<String?> getApplicationDocumentsPath() async {
    return kApplicationDocumentsPath;
  }
}
