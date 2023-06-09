part of 'app_cubit.dart';

enum ColorStatus { red, grey }

class AppState extends Equatable {
  final List<Element> list;
  final ColorStatus colorStatus;

  const AppState({ this.colorStatus = ColorStatus.grey, required this.list});

  AppState.initial()
      : list = <Element>[],
        colorStatus = ColorStatus.grey;

  @override
  List<Object> get props => [list, colorStatus];
}

class Element {
  final String title;
  final String subTitle;

  Element({
    required this.title,
    required this.subTitle,
  });
}
