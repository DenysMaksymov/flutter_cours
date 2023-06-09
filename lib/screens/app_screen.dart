import 'package:app/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  Color color = Colors.transparent;

  test(ColorStatus colorStatus) {
    switch (colorStatus) {
      case ColorStatus.grey:
        return Colors.grey;
        break;
      case ColorStatus.red:
        return Colors.red;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: test(state.colorStatus),
            floatingActionButton: Row(
              children: [
                IconButton(
                  onPressed: () => context.read<AppCubit>().addElement(),
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () => context.read<AppCubit>().deleteElement(),
                  icon: Icon(Icons.map),
                ),
                IconButton(
                  onPressed: () => context.read<AppCubit>().changeColor(),
                  icon: Icon(Icons.map),
                ),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: state.list
                      .map((e) => Row(
                            children: [
                              Text(
                                e.title,
                                style: TextStyle(color: Colors.red),
                              ),
                              Text(e.subTitle),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
