import 'dart:convert';

import 'package:app/animation_test.dart';
import 'package:app/models/user_dto.dart';
import 'package:app/screens/app_screen.dart';
import 'package:app/screens/future_screen.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/loading/loading_cubit.dart';
import 'screens/list_screen.dart';

void main() {
  runApp( MaterialApp(
    home:BlocProvider<LoadingCubit>(
      create: (context) => LoadingCubit(),
      child: LoadingScreen(),
    ),
  ));
}
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoadingScreen(),
//       // home: AppScreen(),
//       // home: FutureScreen(),
//       // home: AnimationTest(),
//       // home: HomeScreen(),
//       // home: TypeData(),
//     );
//   }
// }
