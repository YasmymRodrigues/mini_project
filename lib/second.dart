
import 'package:flutter/material.dart';

class secondPage extends StatefulWidget {
  @override
   _secondPage createState() => _secondPage();

}

class _secondPage extends State<secondPage>{

  List<String> items = <String>[
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'
  ];

  @override
  Widget build(BuildContext context) {
    Iterable<Widget> listTiles = items.map((String item) =>
        buildListTile(context, item));
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Incidentes"),
      ),
      body: Scrollbar(
        child: ListView(
          padding: new EdgeInsets.symmetric(vertical: 8.0),
          children:listTiles.toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:(context) => DetailScreen()));
        },
        child: Icon(Icons.dehaze),
      ),
    );
  }
}

Widget buildListTile(BuildContext context, String item){
  Widget secondary = const Text(
      'Descrição do Incidente'
  );

  return new MergeSemantics(
    child: new ListTile(
      title: Text('Incidente $item: '),
      subtitle:secondary,
    ),
  );
}
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final secondPage todo = ModalRoute.of(context).settings.arguments;

    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("description"),
      ),
    );
  }
}