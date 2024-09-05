import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("../assets/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  final Map<String, AssetImage> _opcoesImagem = {
    'pedra': AssetImage("../assets/pedra.png"),
    'papel': AssetImage("../assets/papel.png"),
    'tesoura': AssetImage("../assets/tesoura.png"),
  };

  void _opcaoSelecionada(String escolhaUsuario) {
    final opcoes = ["pedra", "papel", "tesoura"];

    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do app: " + escolhaApp);
    print("Escolha do usuário: " + escolhaUsuario);

    setState(() {
      this._imagemApp = _opcoesImagem[escolhaApp]!;
    });

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Parabéns!! Você ganhou :D";
      });
    } else if ((escolhaUsuario == "tesoura" && escolhaApp == "pedra") ||
        (escolhaUsuario == "papel" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "pedra" && escolhaApp == "papel")) {
      setState(() {
        this._mensagem = "Que pena!! Você perdeu :c";
      });
    } else {
      setState(() {
        this._mensagem = "Empatamo :/";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PampaPo",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 32),
            child: Text(
              "Escolha do bot",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(
            image: this._imagemApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 32),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => _opcaoSelecionada("pedra"),
                  child: Image.asset(
                    "../assets/pedra.png",
                    height: 100,
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Image.asset(
                    "../assets/papel.png",
                    height: 100,
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Image.asset(
                    "../assets/tesoura.png",
                    height: 100,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
