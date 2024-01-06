import 'package:cat_trivia/business_logic/model/fact_model.dart';
import 'package:dio/dio.dart';
import '../data/remote/retrofit_service.dart';

class FactRepository {
  final CatService _api = CatService(Dio());

  Future<CatFact> fetchFact() async {
    try {
      final fact = await _api.getRandomCatFact('cat');
      return fact;
    } catch (error) {
      rethrow;
    }
  }
}
