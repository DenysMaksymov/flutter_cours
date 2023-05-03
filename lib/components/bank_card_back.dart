import 'package:app/components/bank_card_dto.dart';
import 'package:flutter/material.dart';

class BankCardBack extends StatelessWidget {
  const BankCardBack({
    Key? key,
    required this.data,
  }) : super(key: key);

  final BankCarDTO data;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        width: 350,
        margin: const EdgeInsets.only(bottom: 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.7),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(9, 9), // changes position of shadow
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              data.end,
              data.start,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              height: 60,
              padding: const EdgeInsets.only(right: 30),
              width: double.infinity,
              color: Colors.white12,
              child: cvv(data.cvv),
            ),
            const SizedBox(height: 40)
          ],
        ));
  }

  Widget cvv(String data) {
    return Text(
      data,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    );
  }
}
