import 'package:bloc/bloc.dart';
import 'package:cat_trivia/business_logic/model/fact_model.dart';
import 'package:cat_trivia/business_logic/repository/fact_repository.dart';
import 'package:cat_trivia/business_logic/repository/local_repo.dart';
import 'package:flutter/material.dart';

// FactEvent
abstract class FactEvent {}

class FetchFactEvent extends FactEvent {}

// FactState
abstract class FactState {}

class FactInitialState extends FactState {}

class FactLoadingState extends FactState {}

class FactLoadedState extends FactState {
  final CatFact fact;
  final List<CatFact> facts;

  FactLoadedState(this.fact, {this.facts = const []});
}

class FactErrorState extends FactState {
  final String error;

  FactErrorState(this.error);
}

// FactBloc
class FactBloc extends Bloc<FactEvent, FactState> {
  final FactRepository repository = FactRepository();
  LocalRepo localRepo = LocalRepo();

  FactBloc() : super(FactInitialState()) {
    on<FetchFactEvent>(_fetchFact);
    // init();
  }

  void _fetchFact(FetchFactEvent event, Emitter<FactState> emit) async {
    imageCache.clear();
    emit(FactLoadingState());
    try {
      final CatFact fact = await repository.fetchFact();
      localRepo.saveFact(fact);
      final List<CatFact> facts = localRepo.getFacts();
      emit(FactLoadedState(fact, facts: facts));
    } catch (error) {
      emit(FactErrorState(error.toString()));
    }
  }
}
