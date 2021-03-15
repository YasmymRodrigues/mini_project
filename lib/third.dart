import 'main.dart';
import 'package:flutter/material.dart';
import 'second.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage>{
  final _formKey = GlobalKey<FormState>();
  final snackBar = SnackBar(content: Text('Enviando dados a base de dados ...'));
  final TextEditingController taskController1 = TextEditingController();
  final TextEditingController taskController2 = TextEditingController();
  final TextEditingController taskController3 = TextEditingController();
  List<Incidentes> _incidentes = [];
  List<String> _incid = [];

  var value;
  void showInSnackBar(String value) {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(
             title: Text("Novo Incidente"),
           ),
         body: Padding(
           padding: const EdgeInsets.all(16.0),
           child: Form(
             key: _formKey,
             child: Column(
                     children: <Widget>[
                         TextFormField(
                           controller: taskController1,
                           validator: (value){
                             if(value.isEmpty) return "Campo obrigatorio";
                             if(value.length < 25) return "Maximo de 25 caracteres";
                             return null;
                           },
                           decoration: InputDecoration(
                              labelText: "Titulo",
                             hintText: "Escreva aqui o titulo",
                           ),
                         ),

                         SizedBox(height: 30),
                         TextFormField(
                           controller: taskController2,
                           validator: (value){
                             if(value.isEmpty) return "Campo obrigatorio";
                             if(value.length > 100 && value.length < 200) return "Entre 100 e 200 caracteres";
                             if(value.length < 100) return "Texto entre 100 a 200 caracteres";
                             return null;
                           },
                           decoration: InputDecoration(
                             labelText: "Descrição",
                             hintText: "Descreva seu incidente",
                           ),
                         ),
                         SizedBox(height: 30),
                          TextFormField(
                            controller: taskController3,
                          validator: (value) {
                            if(value.isNotEmpty && value.length < 60 )return "Maximo de 60 caracteres";
                            if (value.isEmpty) return null;
                       },
                        decoration: InputDecoration(
                        labelText: "Morada (opcional)",
                         hintText: "Escreva aqui sua morada",
                        ),
                       ),
                        SizedBox(height: 30),
                            ElevatedButton(
                            child: Text("Enviar incidente"),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                      _incid.add(taskController1.text);
                                      taskController1.clear();
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                    snackBar);
                              }
                              Expanded(
                                    child: ListView.builder(
                                        itemCount: _incid.length,
                                        itemBuilder: (context, index) {
                                          return Card(
                                              child: ListTile(
                                                title: Text(_incid[index]),

                                          )

                                          );
                                        }
                                    ),
                                  );
                                },
                                )
                              ]
                              )
                          )
                      )
                    );
                      }

                  }


class Incidentes{
   String nome;
   String descricao;
   String morada;

   Incidentes(String nome, String descricao,String morada){
     this.nome = nome;
     this.descricao = descricao;
     this.morada = morada;
   }

}