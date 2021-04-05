import 'package:flutter/material.dart';

class TemperatureWidget extends StatefulWidget {
  final nombre;
  final double temperature;
  final height;
  TemperatureWidget(
      {Key? key, @required this.nombre, required this.temperature , this.height = 150.0 })
      : assert(nombre != null),
        assert(temperature != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TemperatureWidgetState();
  }
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  late double temp;
  void initState() {
    temp = widget.temperature;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const _paddingContent =
        EdgeInsets.symmetric(vertical: 5.0, horizontal: 6.0);
    const _cardSidesPadding = 12.0;
    const _cardPadding = EdgeInsets.fromLTRB(
        _cardSidesPadding, _cardSidesPadding, _cardSidesPadding, 6);

    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    var card = Card(
      shadowColor: Colors.grey.shade400,
      elevation: 12.0,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: _cardPadding,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "temperatura ${widget.nombre}",
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
                      flex: 5,
                      child: Padding(
                        padding: _paddingContent,
                        child: Text(
                          "$temp",
                          overflow: TextOverflow.visible,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 4,
                      child: Padding(
                        padding: _paddingContent,
                        child: Image.asset(
                          (temp > 35.00)
                              ? r'assets\Imagenes\Sensores\Temperatura\Termometro_Calor.png'
                              : (temp < 5.00)
                                  ? r'assets\Imagenes\Sensores\Temperatura\Termometro_Frio.png'
                                  : r'assets\Imagenes\Sensores\Temperatura\Termometro.png',
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
    return ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: widget.height,
            minWidth: 170,
            maxWidth:
                (MediaQuery.of(context).orientation == Orientation.portrait)
                    ? deviceWidth / 2 - (_cardSidesPadding * 2)
                    : deviceWidth / 3 - (_cardSidesPadding * 2)),
        child: card);
  }
}
