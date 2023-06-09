import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionState.initial());

  addTransaction(Transaction transaction) {
    emit(TransactionState([...state.listTransaction, ...[transaction]]));
  }

  cleanTransaction() {
    emit(TransactionState([]));
  }
}
