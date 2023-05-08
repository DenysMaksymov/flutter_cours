import 'package:app/components/bank_card/card_switcher.dart';
import 'package:app/components/transaction_list/transaction_item.dart';
import 'package:app/models/bank_card_dto.dart';
import 'package:app/models/transaction_dto.dart';
import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

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

  DraggableScrollableController controller = DraggableScrollableController();

  double opacity = 1.0;

  @override
  void initState() {
    controller.addListener(() => listen());
    super.initState();
  }

  void listen() {
    opacity = 1 - controller.size;
    // print(['opacity ====>', opacity]);
    // print(['controller.size ====>', controller.size]);
    if (opacity > controller.size) {
    } else if (opacity < controller.size) {}
    setState(() {});
  }

  toUp() {
    controller.animateTo(1,
        duration: Duration(milliseconds: 200), curve: Curves.ease);
  }

  toDown() {
    controller.animateTo(.6,
        duration: Duration(milliseconds: 200), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),

      ///TODO Need it in future @DenysMaksymov
      floatingActionButton: OverlayWidget(
        alignment: Alignment.bottomRight,
        overlayWidget: HorizontalHelpWidget(),
        child: Container(),
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     GestureDetector(
      //       onTap: () => toUp(),
      //       child: const Icon(
      //         Icons.arrow_circle_up,
      //         size: 50,
      //       ),
      //     ),
      //     GestureDetector(
      //       onTap: () => toDown(),
      //       child: const Icon(
      //         Icons.arrow_circle_down,
      //         size: 50,
      //       ),
      //     ),
      //   ],
      // ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          AnimatedOpacity(
            opacity: 1,
            // left: left,
            // right: 0,
            duration: Duration(milliseconds: 0),
            // curve: Curves.easeOutBack,
            child: CardSwitcher(
              data: list[0],
            ),
          ),
          DraggableScrollableSheet(
            controller: controller,
            initialChildSize: .6,
            minChildSize: .6,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: transactionList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TransactionItem(
                      data: transactionList[index],
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
