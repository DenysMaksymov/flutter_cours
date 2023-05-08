class TransactionDto{
  TransactionDto({
    required this.date,
    required this.amount,
    required this.name,
});
  final String date;
  final String amount;
  final String name;
}

List<TransactionDto> transactionList = [
  TransactionDto(date: '20-12-23', amount: '500', name: 'Serjo'),
  TransactionDto(date: '20-12-23', amount: '500', name: 'Serjo'),
  TransactionDto(date: '20-12-23', amount: '500', name: 'Serjo'),
  TransactionDto(date: '20-12-23', amount: '500', name: 'Serjo'),
  TransactionDto(date: '20-12-23', amount: '500', name: 'Serjo'),
];