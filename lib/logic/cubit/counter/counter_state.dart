part of 'counter_cubit.dart';

abstract class CounterState extends Equatable {
  @override
  List<Object> get props => [];
}

class CounterInitial extends CounterState {}

class EventGetCounter extends CounterState {
  final int counter;
  EventGetCounter({required this.counter});

  @override
  List<Object> get props => [counter];
}
