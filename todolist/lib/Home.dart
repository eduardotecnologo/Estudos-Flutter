import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<Home> {
TextEditingController _controllerCampo = TextEditingController();
_salvar(){

}
_recuperar(){

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de Dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text(
              "Nada Salvo",
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
                  color: Colors.blue,
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
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Recuperar",
                    style: TextStyle(
                      fontSize: 20
                    )
                  ),
                  onPressed: _recuperar,
                  )
              ],
            )
          ],
        )
      )
    );
  }
}