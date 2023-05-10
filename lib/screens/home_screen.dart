import 'package:app/components/bank_card/card_switcher.dart';
import 'package:app/components/transaction_list/transaction_item.dart';
import 'package:app/models/bank_card_dto.dart';
import 'package:app/models/transaction_dto.dart';
import 'package:app/utils/utils.dart';
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
  double leftCard = 340;
  double leftBalance = 20;

  String balance = '20.000,00 \$';

  bool isShowBalance = true;

  @override
  void initState() {
    controller.addListener(() => listen());
    super.initState();
  }

  void listen() {
    // opacity = 1 - controller.size;
    if (controller.size > 0.6) {
      leftCard = 500;
      leftBalance = -250;
      isShowBalance = false;
    } else if (controller.size == 0.6) {
      leftCard = 340;
      leftBalance = 20;
      isShowBalance = true;
    }
    // print(controller.size);
    // controller.animateTo(1.0, duration: Duration(milliseconds: 300), curve: Curves.ease);

    setState(() {});
  }

  void swipeToLeft() {
    leftCard = 20;
    leftBalance = -250;
    setState(() {});
  }
  void swipeToRight() {
    leftCard = 340;
    leftBalance = 20;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: isShowBalance ? const Text('My Card') : Text(balance),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),

      ///TODO Need it in future @DenysMaksymov
      floatingActionButton: OverlayWidget(
        alignment: Alignment.bottomRight,
        overlayWidget: HorizontalHelpWidget(),
        child: Container(),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          AnimatedPositioned(
            left: leftBalance,
            top: 20,
            duration: const Duration(milliseconds: 100),
            child: balanceCard(),
          ),
          AnimatedPositioned(
            left: leftCard,
            duration: const Duration(milliseconds: 100),
            child: GestureDetector(
              onPanUpdate: (details) {
                if (details.delta.dx > 0) {
                  swipeToRight();
                }
                if (details.delta.dx < 0) {
                  swipeToLeft();
                }
              },
              child: CardSwitcher(
                data: list[0],
              ),
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

  Widget balanceCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          balance,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Credit balance: 10.000,00 ',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Debit balance: 90.000,00 ',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColor.white,
          ),
        ),
      ],
    );
  }
}
