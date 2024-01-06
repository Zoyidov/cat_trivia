import 'package:cat_trivia/business_logic/model/fact_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'retrofit_service.g.dart';

@RestApi(baseUrl: "https://cat-fact.herokuapp.com")
abstract class CatService {
  factory CatService(Dio dio, {String baseUrl}) = _CatService;

  @GET("/facts/random")
  Future<CatFact> getRandomCatFact(@Query("animal_type") String animalType);
}
