import 'package:flutter/material.dart';

// Importes Internos
import 'package:lista_de_compras/ui/ListScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Compras',
      home: ListScreen(),
    );
  }
}