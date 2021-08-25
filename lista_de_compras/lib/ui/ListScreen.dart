import 'package:flutter/material.dart';

// Pacotes Internos
import 'package:lista_de_compras/models/Item.dart';
import 'package:lista_de_compras/ui/AddItem.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key? key}) : super(key: key);
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Item> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => Divider(color: Colors.black38),
          itemCount: items.length,
          itemBuilder: (context, index){

            final item = items[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: IconTheme(
                  child: Icon(Icons.done),
                  data: IconThemeData(color: Colors.white)
                  ),
                ),
              title: Text(item.title, style: TextStyle(color: Colors.blueGrey)),
            );
          },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: _addItem,
        child: Icon(Icons.add),
      ),
    );
  }
  void _addItem() async {
    final item = await showDialog<Item>(
        context: context,
        builder: (BuildContext context){
          return new AddItem();
      }
    );
    setState(() {
    items.add(item!);
    });
  }
}