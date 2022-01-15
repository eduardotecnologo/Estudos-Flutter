import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {

    @override
    _homeState createState() => _homeState();
}

class _homeState extends State<Home> {

    String textoSalvo = "Nada Salvo!";
    TextEditingController _controllerCampo = TextEditingController();

    _salvar() async{
    String valorDigitado = _controllerCampo.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado);

    print("Operação (salvar): $valorDigitado");
  }
    _recuperar(){

  }
    _remover(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff56e4c),
        title: Text("Manipulação de Dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text(
              textoSalvo,
              style: TextStyle(
                fontSize:20
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite algo"
              ),
             controller:  _controllerCampo,
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Salvar",
                    style: TextStyle(
                      fontSize: 20
                    )
                  ),
                  onPressed: _salvar,
                  ),
                  FlatButton(
                  color: Colors.orange,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Recuperar",
                    style: TextStyle(
                      fontSize: 20
                    )
                  ),
                  onPressed: _recuperar,
                  ),
                  FlatButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Remover",
                    style: TextStyle(
                      fontSize: 20
                    )
                  ),
                  onPressed: _remover,
                  )
              ],
            )
          ],
        )
      )
    );
  }
}