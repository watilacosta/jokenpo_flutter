import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  var _result       = "";
  var _escolhaDoApp = "";
  var _imagemApp    = AssetImage("images/padrao.png");

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(opcoes.length);
    _escolhaDoApp = "images/" + opcoes[numero] + ".png";

    setState(() {
      _imagemApp = AssetImage(_escolhaDoApp);
      // Situaçoes de vitoria do usuario
      if(
        (escolhaUsuario == "pedra"   && _escolhaDoApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && _escolhaDoApp == "papel")   ||
        (escolhaUsuario == "papel"   && _escolhaDoApp == "pedra")
      ) {
        _result = "Parabéns, você venceu!";
      } else if (
        (_escolhaDoApp == "pedra"   && escolhaUsuario == "tesoura") ||
        (_escolhaDoApp == "tesoura" && escolhaUsuario == "papel")   ||
        (_escolhaDoApp == "papel"   && escolhaUsuario == "pedra")
      ){
        _result = "O App te venceu!!!";
      } else {
        _result = "Empate!!!";
      }
    });
  }

  void _resetGame() {
    setState(() {
      _result = "";
      _escolhaDoApp = "";
      _imagemApp = AssetImage("images/padrao.png");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JokenPo'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Text(
                'Escolha do App',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 23,
                  fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: 40),
                child: Image(image: _imagemApp,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 80),
                child: Text(
                    _result,
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 23,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Image.asset('images/pedra.png', height: 110),
                    onTap: () => _opcaoSelecionada("pedra"),
                  ),
                  GestureDetector(
                    child: Image.asset('images/papel.png', height: 110),
                    onTap: () => _opcaoSelecionada("papel"),
                  ),
                  GestureDetector(
                    child: Image.asset('images/tesoura.png', height: 110),
                    onTap: () => _opcaoSelecionada("tesoura"),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 35),
                child: Text(
                    'Faça sua Escolha',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.normal
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 70),
                child: GestureDetector(
                  onTap: _resetGame,
                  child: Text(
                      '< Reiniciar >',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      )
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
