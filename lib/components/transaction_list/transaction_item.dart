import 'package:app/models/transaction_dto.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({Key? key, required this.data}) : super(key: key);

  final TransactionDto data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(data.date),
          Text(data.name),
          Text(data.amount),
        ],
      ),
    );
  }
}
