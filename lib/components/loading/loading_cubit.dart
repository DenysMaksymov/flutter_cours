import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loading_state.dart';

class LoadingCubit extends Cubit<LoadingState> {
  LoadingCubit() : super(LoadingState.initial());

  addItemList() {
    emit(LoadingState(list: [
      ...state.list,
      {'name': state.name, 'age': state.age}
    ], name: state.name, age: state.age));
  }

  addName(String newName) {
    emit(LoadingState(list: state.list, name: newName, age: state.age));
  }

  addAge(int newAge) {
    emit(LoadingState(list: state.list, name: state.name, age: newAge));
  }

  cleanList(){
    emit(LoadingState(list: [], name: state.name, age: state.age));
  }
}

class DataList {
  static List<Map> listMap = [
    {'name': 'Denys', 'age': 33},
    {'name': 'AAAAA', 'age': 33},
    {'name': 'DDD', 'age': 33},
    {'name': 'VVV', 'age': 33},
    {'name': 'HHHH', 'age': 33},
  ];
}
