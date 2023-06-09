import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/loading/loading_cubit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, LoadingState>(
      builder: (context, state) {
        return Scaffold(
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    onChanged: (value) {
                      context.read<LoadingCubit>().addName(value ?? '');
                    },
                  ),
                  TextField(
                    onChanged: (value) {
                      context
                          .read<LoadingCubit>()
                          .addAge(int.parse(value ?? '0'));
                    },
                  ),
                  FilledButton(
                    onPressed: () => context.read<LoadingCubit>().addItemList(),
                    child: Text('Add item to list'),
                  ),
                  FilledButton(
                    onPressed: () => context.read<LoadingCubit>().cleanList(),
                    child: Text('Clean list'),
                  ),
                ],
              ),
            ),
            body: ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(state.list[index]['name']),
                    subtitle: Text(state.list[index]['age'].toString()),
                  );
                }));
      },
    );
  }
}
