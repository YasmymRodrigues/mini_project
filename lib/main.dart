import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mini_project/data/datasource.dart';
import 'first.dart';
import 'second.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: firstPage(),

    );
  }
}

//Da Valores
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

  }

//
class Button extends StatelessWidget{
  final double width, height;
  final Function onPressed; //
  final String text;
  final Color color;

  Button({
    Key key,
    this.text,
    this.width,
    this.height,
    this.color = Colors.green,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(2.0),
      child: MaterialButton(
        onPressed: () => onPressed(text),
        child: Text(
          text,
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  List<String> items = <String>[
    '1', '2', '3', '4', '5', '6','7','8','9','10','11','12'
  ];

  @override
  Widget build(BuildContext context) {
    Iterable<Widget> listTiles = items.map((String item) => buildListTile(context, item));
    body: Scrollbar(
        child: ListView(
          padding: new EdgeInsets.symmetric(vertical: 8.0),
          children: listTiles.toList(),
        )
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Incidentes do Municipio'),
        backgroundColor: Colors.lightGreen,
        actions: [
          Button(
            text: "Enviar",
          )
        ],
      ),
      body: Scrollbar(
          child: ListView(
            padding: new EdgeInsets.symmetric(vertical: 8.0),
            children: listTiles.toList(),
          )
      ),
    );
  }
}

//isso herda da MyHomePage
class _ListasPageState extends StatelessWidget{

  List<String> items = <String>[
    'A', 'B', 'C','D'
  ];
  @override
  Widget build(BuildContext context){
    
    Iterable<Widget> listTiles = items.map((String item) => buildListTile(context, item));
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Lista de Incidentes'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Scrollbar(
        child:
          TextField(
            decoration: InputDecoration(
              hintText: "Digite seu incidente aqui",
              labelText: "Incidente",
              labelStyle: TextStyle(
                fontSize: 24,
                color: Colors.blue
              ),
             ),
            keyboardType: TextInputType.text,
          )
      ),
    );
  }
}

Widget buildListTile(BuildContext context, String item){
  Widget secondary = const Text(
    'Descri'
  );

  return new MergeSemantics(
    child: new ListTile(
      title: Text('Incidente $item: '),
      subtitle:secondary,
    ),
  );
}

