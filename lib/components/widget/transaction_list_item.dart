import 'package:app/cubit/transaction/transaction_cubit.dart';
import 'package:flutter/material.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: transaction.isSend? Colors.green : Colors.red,
      title: Text(transaction.amount.toString()),
      subtitle: Text(transaction.date.toString()),
    );
  }
}
