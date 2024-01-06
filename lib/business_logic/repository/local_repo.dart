// repo for save and get list of cat facts from hive
// ignore_for_file: depend_on_referenced_packages

import 'package:cat_trivia/business_logic/model/fact_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class LocalRepo {
  late Box<CatFact> factsBox = Hive.box<CatFact>('factsCat');

  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    await Hive.initFlutter();
    Hive.registerAdapter(CatFactAdapter());
    await Hive.openBox<CatFact>('factsCat');
  }

  Future<void> saveFact(CatFact fact) async {
    final factsBox = Hive.box<CatFact>('factsCat');
    factsBox.add(fact);
  }

  List<CatFact> getFacts() {
    final factsBox = Hive.box<CatFact>('factsCat');
    return factsBox.values.toList();
  }
}
