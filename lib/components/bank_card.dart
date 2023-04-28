import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  const BankCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 350,
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
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Colors.black,
            Colors.black54,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Row(
              children: const [
                Icon(
                  Icons.local_convenience_store_outlined,
                  color: Colors.white,
                ),
                SizedBox(width: 15),
                Text(
                  'Universal Bank',
                  style: TextStyle(
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
                numberText('0000'),
                const SizedBox(width: 20),
                numberText('0000'),
                const SizedBox(width: 20),
                numberText('0000'),
                const SizedBox(width: 20),
                numberText('0000'),

              ],
            ),
            const SizedBox(height: 30),
            cvv()
            
          ],
        ),
      ),
    );
  }

  Widget numberText(String number) {
    return Text(
      number,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    );
  }

  Widget cvv() {
    return Text(
      '006',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    );
  }
}
