import 'package:flutter/material.dart';
import 'package:netgrow/Sensors_widgets/humidity_widget.dart';
import 'package:netgrow/Sensors_widgets/soil_widget.dart';
import 'file:///F:/Git/NetGrow/netgrow/lib/Sensors_widgets/light_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    var _lightTile = Row(
      key: Key("Light"),
      children: [
        LightWidget(
          estado: true,
          nombre: "1",
        ),
        LightWidget(
          estado: true,
          nombre: "2",
        ),
      ],
    );

    var _tempTile = Center(key: Key("temp"),child: Wrap( spacing: 8.0, runSpacing: 8.0,  alignment: WrapAlignment.center,
      key: Key("temp"),
      children: [
        TemperatureWidget(nombre: "1", temperature: 40.00)
      ],
    ),);

    var _soilTile = Center(key: Key("soil"),child: Wrap( spacing: 8.0, runSpacing: 8.0,  alignment: WrapAlignment.center,
      key: Key("s"),
      children: [
        SoilWidget(nombre: 1, humidity: 40),SoilWidget(nombre: 2, humidity: 10),SoilWidget(nombre: 2, humidity: 10)
      ],
    ),);

    var _humTile = Row(key: Key("hum"), children: [
      HumidityWidget(nombre: "1", humedad: 40.00),
    ]);

    var _items = [_lightTile, _tempTile, _humTile, _soilTile];

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: ReorderableListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          buildDefaultDragHandles: true,
          // TODO - cambiar a false , para usar siempre lineas , no solo en desktop. para eso hay que hacer una funcion que cree los items dinamicamente

          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final item = _items.removeAt(oldIndex);
              _items.insert(newIndex, item);
            });
          },

          children:,
        ));
  }
}
