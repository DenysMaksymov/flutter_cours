part of 'transaction_cubit.dart';

class TransactionState extends Equatable {
  final List<Transaction> listTransaction;

  const TransactionState(this.listTransaction);

  TransactionState.initial() : listTransaction = [];

  @override
  List<Object> get props => [listTransaction];
}

enum TransactionStatus { send, receiver }

class Transaction {
  final String date;
  final double amount;
  final String fullName;
  final TransactionStatus status;

  bool get isSend => status == TransactionStatus.send;

  Transaction({
    required this.date,
    required this.amount,
    required this.fullName,
    required this.status,
  });
}
