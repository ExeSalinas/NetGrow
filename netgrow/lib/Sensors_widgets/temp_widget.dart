import 'package:flutter/material.dart';

class TemperatureWidget extends StatefulWidget {
  final nombre;
  final double temperature;
  TemperatureWidget(
      {Key key, @required this.nombre, @required this.temperature})
      : assert(nombre != null),
        assert(temperature != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TemperatureWidgetState();
  }
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  double temp;
  void initState() {
    temp = widget.temperature;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var card = Card(
      shadowColor: Colors.grey.shade400,
      elevation: 12.0,
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TODO setear  theme

            Center(child: Text("Sensor de temperatura ${widget.nombre}")),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Center(child: Text("$temp")),
                  ),
                  Expanded(
                    child: Image.asset(
                      (temp > 35.00)
                          ? r'assets\Imagenes\Sensores\Temperatura\Termometro_Calor.png'
                          : r'assets\Imagenes\Sensores\Temperatura\Termometro.png',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    return Flexible(
      fit: FlexFit.tight,
      child: Container(padding: EdgeInsets.all(8.0), height: 150, child: card),
    );
  }
}
