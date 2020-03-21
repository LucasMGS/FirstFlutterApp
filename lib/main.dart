import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() {
  runApp(QuizApp());
}

class _QuizAppState extends State<QuizApp> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual o nome do vírus pandêmico do ano 2020?',
      'resposta': [
        {'texto': 'COVID-19', 'pontuacao': 10},
        {'texto': 'COVID-20', 'pontuacao': 6},
        {'texto': 'H1N1', 'pontuacao': 5},
        {'texto': 'Não sei', 'pontuacao': 2},
      ]
    },
    {
      'texto': 'Qual o nome popular do vírus COVID-19?',
      'resposta': [
        {'texto': 'Coronga', 'pontuacao': 5},
        {'texto': 'Corote', 'pontuacao': 6},
        {'texto': 'Corona', 'pontuacao': 10},
        {'texto': 'Coringa', 'pontuacao': 2},
      ]
    },
    {
      'texto': 'Qual a principal maneira de combater o vírus COVID-19?',
      'resposta': [
        {'texto': 'Inventar fake news', 'pontuacao': 6},
        {'texto': 'Panelaço', 'pontuacao': 5},
        {'texto': 'Porrete', 'pontuacao': 2},
        {'texto': 'Ficar em casa e usar álcool em gel', 'pontuacao': 10},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  bool get temPerguntaSelecionada 
  {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _reiniciarQuiz() 
  {
    setState(() {
      _pontuacaoTotal = 0;
      _perguntaSelecionada = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Quiz', style: TextStyle(fontSize: 20)
              )
            ),
            body: temPerguntaSelecionada ? 
                Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    responder: _responder)
                : Resultado(_pontuacaoTotal, _reiniciarQuiz)
                )
            );
  }
}

class QuizApp extends StatefulWidget {
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
