import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontos;
  final void Function() onRestart;

  const Resultado(this.pontos, this.onRestart);

  String get fraseResultado {
    if (pontos < 8) {
      return 'Congrats!';
    } else if (pontos < 12) {
      return 'You are doing great!!';
    } else if (pontos < 16) {
      return 'Impressive!!!';
    } else {
      return 'You are a Master!!!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: onRestart,
          child: const Text("Restart",
          style: TextStyle(
            fontSize: 14
          ),),
        )
      ],
    );
  }
}
