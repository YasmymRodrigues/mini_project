import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/second.dart';
import 'package:mini_project/third.dart';

class firstPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Controle de Incidentes do Municipio"),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget> [
                ElevatedButton(
                //color: Colors.red,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => secondPage()));
                 },
                   child: Text("Lista de Incidentes")
               ),
                ElevatedButton(
                  //color: Colors.red,
                   onPressed: () {
                   Navigator.push(context, MaterialPageRoute(
                     builder: (BuildContext context) => FormPage()));
                    },
                    child: Text("Novo Incidente")
                )
              ],
            ),

          ),

        ),

    );
  }
}

