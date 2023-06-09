import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({Key? key, required this.balance}) : super(key: key);

  final double balance;

  @override
  Widget build(BuildContext context) {
    return Text(
      balance.toString(),
      style: TextStyle(fontSize: 24, color: Colors.black),
    );
  }
}
