import 'package:app/components/bank_card_dto.dart';
import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  const BankCard({
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
            data.start,
            data.end,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.local_convenience_store_outlined,
                  color: Colors.white,
                ),
                const SizedBox(width: 15),
                Text(
                  data.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            const SizedBox(height: 60),
            Row(
              children: [
                numberText(data.bin1),
                const SizedBox(width: 20),
                numberText(data.bi2),
                const SizedBox(width: 20),
                numberText(data.bi3),
                const SizedBox(width: 20),
                numberText(data.bi4),
              ],
            ),
            const SizedBox(height: 30),
            date(data.dateExp)
          ],
        ),
      ),
    );
  }

  Widget numberText(String number) {
    return Text(
      number,
      style: TextStyle(
        color: data.titleColor,
        fontSize: 18,
      ),
    );
  }

  Widget date(String data) {
    return Text(
      data,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    );
  }
}
