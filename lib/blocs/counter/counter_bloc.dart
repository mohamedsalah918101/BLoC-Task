
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}
class IncrementCounter extends CounterEvent {}
class DecrementCounter extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementCounter>((event, emit) => emit(state + 1));
    on<DecrementCounter>((event, emit) => emit(state - 1));
  }
}