import 'package:flutter/material.dart';

class HomePAgeTemp extends StatelessWidget {
  final opciones = ['Uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Componentes Temp'),
        ),
        body: ListView(
          children: _crearItemsCorto()
        ),
      );
  }

  List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();

    for (String o in opciones) {
      final tempWidget = ListTile(
        title: Text(o),
      );
      lista..add(tempWidget)
           ..add(Divider(color: Colors.black,));
      //lista.add(Divider(color: Colors.black,));
    }

    return lista;
  }

  List<Widget> _crearItemsCorto(){

    var widgets = opciones.map((item){ //itme debe ser del tipo de ato de "opciones!
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('subtitulo'),
            leading: Icon(Icons.access_alarms),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider(color: Colors.blue,),
        ],
      );
    }).toList(); //toList() transforma el Iterable<ListTitle> en List<Widgets>

    return widgets;
  }
}