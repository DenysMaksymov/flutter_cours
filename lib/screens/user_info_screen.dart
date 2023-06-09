import 'package:app/models/user_dto.dart';
import 'package:flutter/material.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${user.firsName}' + '${user.lastName}'),
          Text('age' + '${user.age}'),
        ],
      ),
    );
  }
}
