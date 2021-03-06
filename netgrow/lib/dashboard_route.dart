import 'package:flutter/material.dart';
import 'package:netgrow/Sensors_widgets/humidity_widget.dart';
import 'package:netgrow/Sensors_widgets/soil_widget.dart';
import 'package:netgrow/Sensors_widgets/light_widget.dart';
import 'package:netgrow/Sensors_widgets/temp_widget.dart';

// TODO AGREGAR PAGEVIEW
class DashboardRoute extends StatefulWidget {
  DashboardRoute({Key? key, required this.title}) : super(key: key);

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _DashboardRouteState createState() => _DashboardRouteState();
}

class _DashboardRouteState extends State<DashboardRoute> {
  // int _counter = 0;
  var _sensores = [];
  @override
  void initState() {
    setState(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    var _lightTile =  [
      LightWidget(
        estado: true,
        nombre: "1",
      ),LightWidget(
        estado: true,
        nombre: "2",
      ),
    ]
    ;

    var _tempTile = [
      TemperatureWidget(nombre: "1", temperature: 40.00),
      TemperatureWidget(nombre: "1", temperature: 40.00),
      TemperatureWidget(nombre: "1", temperature: 40.00),
    ]
    ;

    var _soilTile =  [
      SoilWidget(nombre: 1, humidity: 40),
      SoilWidget(nombre: 2, humidity: 10),
      SoilWidget(nombre: 2, humidity: 10)
    ];

    var _humTile = [
      HumidityWidget(nombre: "1", humedad: 40.00),
    ];

    _sensores = [ _lightTile,_humTile, _tempTile, _soilTile];








    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title ,style: Theme.of(context).textTheme.headline5,),
      ),
      body: ReorderableListView(
        header: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Informacion de tu Vivero", style: Theme.of(context).textTheme.headline4, textAlign: TextAlign.center,),
        ),
        padding: const EdgeInsets.all(8.0),
        buildDefaultDragHandles: true,
        // TODO - cambiar a false , para usar siempre lineas , no solo en desktop. para eso hay que hacer una funcion que cree los items dinamicamente
        
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final item = _sensores.removeAt(oldIndex);
            _sensores.insert(newIndex, item);
          });
        },
        children: <Widget>[
          for (int index = 0; index < _sensores.length; index++)
            Padding(key: Key("$index"),
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Wrap(

                spacing: 8.0,
                runSpacing: 4.0,
                alignment: WrapAlignment.center,
                children: _sensores[index],
              ),
            )
        ],
      ),
    );
  }
}
