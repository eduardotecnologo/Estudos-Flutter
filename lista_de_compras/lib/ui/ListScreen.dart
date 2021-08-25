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
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(color: Colors.black38),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: IconTheme(
                    child: Icon(item.isDone ? Icons.done_all : Icons.done),
                    data: IconThemeData(color: Colors.white)),
              ),
              title: Text(item.title, style: TextStyle(color: Colors.blueGrey)),
              onTap: () {
                setState(() {
                  items[index].isDone = !items[index].isDone;
                });
              },
            );
          },
        ),
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
        builder: (BuildContext context) {
          return new AddItem();
        });

        if(item != null){
          setState(() => items.add(item));
      }
    }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 1));
      setState(() {
        items.sort((a, b) {
          if (a.isDone && !b.isDone)
            return 1;
          else if (!a.isDone && b.isDone) return -1;
            return 0;
      });
    });
    return Future.value();
  }
}
