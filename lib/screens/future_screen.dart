import 'package:app/components/widget/balance_card.dart';
import 'package:app/components/widget/transaction_list_item.dart';
import 'package:app/cubit/transaction/transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/balance/balance_cubit.dart';

class FutureScreen extends StatefulWidget {
  const FutureScreen({Key? key}) : super(key: key);

  @override
  State<FutureScreen> createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  Color color = Colors.grey;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<BalanceCubit>(create: (_) => BalanceCubit()),
          BlocProvider<TransactionCubit>(create: (_) => TransactionCubit()),
        ],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // const SizedBox(height: 50),
                Container(
                  color: Colors.black,
                  child: BlocBuilder<BalanceCubit, BalanceState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          BalanceCard(
                            balance: state.balance,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FilledButton(
                                  onPressed: () => context
                                      .read<BalanceCubit>()
                                      .addBalance(100.0),
                                  child: Text('+100')),
                              FilledButton(
                                  onPressed: () => context
                                      .read<BalanceCubit>()
                                      .addBalance(500.0),
                                  child: Text('+500')),
                              FilledButton(
                                  onPressed: () => context
                                      .read<BalanceCubit>()
                                      .addBalance(1000.0),
                                  child: Text('+1000')),
                              FilledButton(
                                  onPressed: () =>
                                      context.read<BalanceCubit>().cleanBalance(),
                                  child: Text('Clean')),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
                // const Spacer(),
                BlocBuilder<TransactionCubit, TransactionState>(
                  builder: (context, state) {
                    return Container(
                      height: 400,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FilledButton(
                                  onPressed: () => context
                                      .read<TransactionCubit>()
                                      .addTransaction(Transaction(date: '23/02/2022', amount: 500.0, fullName: 'Denys Makssymov', status: TransactionStatus.send)),
                                  child: Text('Send 500.00')),
                              FilledButton(
                                  onPressed: () => context
                                      .read<TransactionCubit>()
                                      .addTransaction(Transaction(date: '24/02/2022', amount: 1000.0, fullName: 'Denys Makssymov', status: TransactionStatus.receiver)),
                                  child: Text('Recipient 1000')),

                              FilledButton(
                                  onPressed: () =>
                                      context.read<TransactionCubit>().cleanTransaction(),
                                  child: Text('Clean')),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.listTransaction.length,
                                itemBuilder: (_, index){
                              return TransactionListItem(
                                  transaction: state.listTransaction[index]
                              );
                            }),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
