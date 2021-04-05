import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LightWidget extends StatefulWidget {
  final bool estado;
  final nombre;
  LightWidget({Key? key, required this.estado, required this.nombre})
      : assert(estado != null),
        assert(nombre != null),
        super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _LightWidgetState();
  }
}

class _LightWidgetState extends State<LightWidget> {
  var estado;
  @override
  void initState() {
    estado = widget.estado;
    super.initState();
  }

  void _cardTap() {
    setState(() {
      estado = !estado;
    });
  }

  @override
  Widget build(BuildContext context) {
    var card = InkWell(
      onTap: _cardTap,
      child: Card(
        shadowColor: Colors.grey.shade400,
        elevation: 12.0,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // TODO setear  theme
              Text("Sensor de luz ${widget.nombre}"),
              Expanded(
                child: Image.asset(
                  estado
                      ? r'assets\Imagenes\Sensores\Luz\bombilla_encendida.png'
                      : r'assets\Imagenes\Sensores\Luz\bombilla.png',
                ),
              )
            ],
          ),
        ),
      ),
    );
    return Flexible( fit: FlexFit.tight ,
      child: Container(
          padding: EdgeInsets.all(8.0),
          height: 150,

          child: card),
    );
  }
}
