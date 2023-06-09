import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit() : super(const BalanceState.initial());

  addBalance(double amount) {
    emit(BalanceState(state.balance + amount));
  }

  cleanBalance() {
    emit(const BalanceState(0.0));
  }
}
