import 'dart:ui';

class BankCarDTO {
  final String title;
  final String bin1;
  final String bi2;
  final String bi3;
  final String bi4;
  final String dateExp;
  final String cvv;
  final Color start;
  final Color end;
  final Color titleColor;

  BankCarDTO({
    required this.title,
    required this.bin1,
    required this.bi2,
    required this.bi3,
    required this.bi4,
    required this.dateExp,
    required this.start,
    required this.end,
    required this.titleColor,
    required this.cvv,
  });
}
