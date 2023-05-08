import 'dart:math';

import 'package:app/models/bank_card_dto.dart';
import 'package:flutter/material.dart';

import 'bank_card.dart';
import 'bank_card_back.dart';

class CardSwitcher extends StatefulWidget {
  const CardSwitcher({
    Key? key,
    required this.data,
  }) : super(key: key);

  final BankCarDTO data;

  @override
  State<CardSwitcher> createState() => _CardSwitcherState();
}

class _CardSwitcherState extends State<CardSwitcher> {
  bool showFrontSide = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showFrontSide = !showFrontSide;
        setState((){});
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: transitionBuilder,
          child: showFrontSide
              ? BankCard(
                  data: widget.data,
                )
              : BankCardBack(
                  data: widget.data,
                ),
        ),
      ),
    );
  }

  Widget transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(showFrontSide) != widget?.key);
        final value = isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }
}
