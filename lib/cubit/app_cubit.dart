import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.initial());

  List<Element> list = [];

  changeColor() {
    emit(AppState(
        colorStatus: state.colorStatus == ColorStatus.grey
            ? ColorStatus.red
            : ColorStatus.grey,
        list: state.list));
  }

  addElement() async {
    List<Element> list = [];
    await Timer.periodic(Duration(seconds: 20), (timer) {
      list.add(Element(title: 'Title', subTitle: 'SubTitle'));
      emit(AppState(list: [...state.list, ...list]));
    });


  }

  deleteElement() {
    list = [];
    list.addAll(state.list);

    list.remove(state.list.last);

    emit(AppState(list: list));
  }
}
