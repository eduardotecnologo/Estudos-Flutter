import 'package:flutter/material.dart';
import 'package:lista_de_compras/models/Item.dart';

class AddItem extends StatelessWidget {

  final itemC = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Item'),
      content: TextField(
        autofocus: true,
        controller: itemC,
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancelar'),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Adicionar'),
          onPressed: (){
            final item = new Item(title: itemC.value.text);
            itemC.clear();
            Navigator.of(context).pop(item);
          },
        )
      ],
    );
  }
}