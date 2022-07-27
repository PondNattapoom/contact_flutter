import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/data/repositories/index.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit({required this.counterRepository}) : super(CounterInitial());
  final CounterRepository counterRepository;

// #1: Action function
  void funcIncreaseCounter(int input) {
    emit(
        EventGetCounter(counter: counterRepository.increaseRepoCounter(input)));
  }

  void funcDecreaseCounter(int input) {
    emit(
        EventGetCounter(counter: counterRepository.decreaseRepoCounter(input)));
  }

  void funcGetCounter() {
    emit(EventGetCounter(counter: counterRepository.getCurrentCounter()));
  }
}
