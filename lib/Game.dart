import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  var _result = "";

  void setResult() {
    setState(() {
      _result = 'Ganhou!!!';
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
                padding: EdgeInsets.only(top: 40, bottom: 80),
                child: Image.asset('images/padrao.png'),
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
                  Image.asset('images/pedra.png', height: 110),
                  Image.asset('images/papel.png', height: 110),
                  Image.asset('images/tesoura.png', height: 110),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                    'Faça sua Escolha',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.normal
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
