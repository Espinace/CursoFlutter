import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _selectedQuestion = 0;
  var _pontuacaoTotal = 0;
  final List<Map> _questions = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontos': 8},
        {'texto': 'Vermelho', 'pontos': 4},
        {'texto': 'Branco', 'pontos': 6},
        {'texto': 'Azul', 'pontos': 10}
      ],
    },
    {
      'texto': 'Qual e o seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontos': 10},
        {'texto': 'Gato', 'pontos': 6},
        {'texto': 'Girafa', 'pontos': 5},
        {'texto': 'Elefante', 'pontos': 3}
      ],
    },
    {
      'texto': 'Qual time voce torce?',
      'respostas': [
        {'texto': 'Sao Paulo', 'pontos': 5},
        {'texto': 'Santos', 'pontos': 10},
        {'texto': 'Palmeiras', 'pontos': 6},
        {'texto': 'Corinthians', 'pontos': 0}
      ],
    }
  ];
  void _answer(int pontos) {
    if (temPerguntaSelecionada) {
      setState(() {
        _selectedQuestion++;
        _pontuacaoTotal += pontos;
      });
    }
    print(_pontuacaoTotal);
  }

  void _restart() {
    setState(() {
      _selectedQuestion = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  questions: _questions,
                  selectedQuestion: _selectedQuestion,
                  onAnswer: _answer)
              : Resultado(_pontuacaoTotal, _restart)),
    );
  }
}
