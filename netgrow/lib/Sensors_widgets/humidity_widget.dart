import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HumidityWidget extends StatefulWidget {
  final String nombre;
  final humedad;
  HumidityWidget({Key? key, required this.nombre, required this.humedad})
      : assert(nombre != null),
        assert(humedad != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HumiditWidgetState();
  }
}

class _HumiditWidgetState extends State<HumidityWidget> {
  late double hum;

  void initState() {
    hum = widget.humedad;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const _padding = EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0);

    var card = Card(
      shadowColor: Colors.grey.shade400,
      elevation: 12.0,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Sensor de humedad ${widget.nombre}",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Padding(
                        padding: _padding,
                        child: Text(
                          "$hum %",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ),
                    Flexible(  fit: FlexFit.loose,
                      child: Padding(
                        padding: _padding,
                        child: Image.asset(
                          r'assets\Imagenes\Sensores\Humedad\humidity.png',
                        ),
                      ),
                    ),
                  ],
                ),
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
