import 'package:app/components/bank_card.dart';
import 'package:app/components/bank_card_back.dart';
import 'package:app/components/bank_card_dto.dart';
import 'package:app/components/card_switcher.dart';
import 'package:app/components/item.dart';
import 'package:flutter/material.dart';

import 'validation_input.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BankCarDTO> list = [
    BankCarDTO(
        title: 'Universal Bank',
        bin1: '3333',
        bi2: '1111',
        bi3: '1111',
        bi4: '1111',
        dateExp: '03/99',
        start: Colors.black,
        end: Colors.black45,
        titleColor: Colors.white,
        cvv: '000'),
    BankCarDTO(
        title: 'UK Bank',
        bin1: '2222',
        bi2: '2222',
        bi3: '2222',
        bi4: '5555',
        dateExp: '06/50',
        start: Colors.blue,
        end: Colors.yellow,
        titleColor: Colors.black,
        cvv: '111'),
    BankCarDTO(
        title: 'UK Bank',
        bin1: '2222',
        bi2: '2222',
        bi3: '2222',
        bi4: '5555',
        dateExp: '06/50',
        start: Colors.green,
        end: Colors.yellow,
        titleColor: Colors.black,
        cvv: '222'),
    BankCarDTO(
        title: 'UK Bank',
        bin1: '2222',
        bi2: '2222',
        bi3: '2222',
        bi4: '5555',
        dateExp: '06/50',
        start: Colors.green,
        end: Colors.yellow,
        titleColor: Colors.black,
        cvv: '333'),
    BankCarDTO(
        title: 'UK Bank',
        bin1: '2222',
        bi2: '2222',
        bi3: '2222',
        bi4: '5555',
        dateExp: '06/50',
        start: Colors.green,
        end: Colors.yellow,
        titleColor: Colors.black,
        cvv: '444'),
  ];

  late BankCarDTO g;

  String data = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValidationInput(onInput: (value ) {
                  data = value;
                  setState(() {

                  });
                },

                ),
                Item(
                  data: data,
                )

                // ...list.map((value) => CardSwitcher(
                //       data: value,
                //     ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
