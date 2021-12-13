import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';

class Questionario extends StatelessWidget {
  final List<Map<dynamic, dynamic>> questions;
  final int selectedQuestion;
  final void Function(int) onAnswer;

  const Questionario({
    required this.questions,
    required this.selectedQuestion,
    required this.onAnswer
  });

    bool get temPerguntaSelecionada {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<dynamic,dynamic>> respostas = temPerguntaSelecionada 
      ? questions[selectedQuestion].cast()['respostas']
      : [];

    return Column(
      children: <Widget>[
        Questao(questions[selectedQuestion]['texto'].toString()),
        ...respostas
        .map((resp) {
         return Resposta(
           resp['texto'].toString(),
           () => onAnswer(int.parse(resp['pontos'].toString()))
         );
        }) .toList(),
      ],
    );
  }
}
