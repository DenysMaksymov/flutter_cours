part of 'loading_cubit.dart';

class LoadingState extends Equatable {
  final List<Map> list;

  final String name;
  final int age;



  const LoadingState(
      {required this.list, required this.name, required this.age});

  LoadingState.initial()
      : list = DataList.listMap,
        name = '',
        age = 0;

  @override
  List<Object> get props => [list, name, age];
}
