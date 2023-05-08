import 'package:app/components/transaction_list/transaction_item.dart';
import 'package:app/models/transaction_dto.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...transactionList.map(
                  (value) => TransactionItem(
                    data: value,
                  ),
                ),
                ...transactionList.map(
                      (value) => TransactionItem(
                    data: value,
                  ),
                ),
                ...transactionList.map(
                      (value) => TransactionItem(
                    data: value,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
