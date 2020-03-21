import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() responder;

  Resposta(this.texto, this.responder);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
      width: double.infinity,
      child: RaisedButton(
              child: Text(texto,
              style: TextStyle(fontSize: 20,
                              fontStyle: FontStyle.italic
                              )
              ),
              onPressed: responder,
              textColor: Colors.white,
              color: Colors.blue
              ),
    );
  }
}