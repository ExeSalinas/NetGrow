import 'package:flutter/material.dart';
import 'package:netgrow/arduino_tile.dart';

import 'arduino.dart';

// Constantes
List<Arduino> arduinos = [
  Arduino(conexion: "123456", nombre: "sativa 1 ", sensores: []),
  Arduino(conexion: "789123", nombre: "sativa 2", sensores: [])
];

class MisArduino extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MisArduinoState();
  }
}

class _MisArduinoState extends State {

  //TODO  aprender sobre las keys
  final _formKey = GlobalKey<FormState>();

  void _addButonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(content: Stack( clipBehavior: Clip.none, children: <Widget>[
          //Cruz roja:  Cierra el dialog
          Positioned(
            right: -40.0,
            top: -40.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                child: Icon(Icons.close),
                backgroundColor: Colors.red.shade700,
              ),
            ),
          ),
          Form(
            // TODO Revisar las propiedades del FORM
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text("Agregar"),
                    onPressed: () {
                      // TODO AGREGAR ALA LISTAS DE ARDUINOS
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],),);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Mis Arduino'),
      ),
      body: ListView(
        children: [
          ArduinoTile(arduino: arduinos[0]),
          ArduinoTile(arduino: arduinos[1])
        ],
      ),
      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.add),
        tooltip: "Registrar un Nuevo dispositivo",
        onPressed: () => _addButonPressed(context),
      ),
    );
  }
}
