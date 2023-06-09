part of 'balance_cubit.dart';

class BalanceState extends Equatable {
  final double balance;

  const BalanceState(this.balance);

  const BalanceState.initial() : balance = 0.0;

  @override
  List<Object> get props => [balance];
}
