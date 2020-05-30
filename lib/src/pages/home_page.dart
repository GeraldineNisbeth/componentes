import 'package:flutter/material.dart';

import 'package:componentes/src/pages/utils/icono_string_util.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
        backgroundColor: Colors.lightGreen,
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],//informacion qeu aparece por defecto hasta qeu cargue la data
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){//el tipode dato list<dynacmic> x cargardata()

        //el bulder se dispara cuando tenog la data o cuando hay error,  cuando se pide info
        return ListView(
        children: _listaItems(snapshot.data,context),
        );
      },
    );
    
    
  }

  List<Widget>_listaItems(List<dynamic>data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.lightGreen),
        onTap: (){
          //Para la naveción entre Routes(recomendado para 1sola route)
          /*final route = MaterialPageRoute(
            builder: (context) => AlertPage(),
          );
          
          Navigator.push(context, route);*/
          Navigator.pushNamed(context, element['ruta']);
        },
      );
      opciones..add(widgetTemp)
      ..add(Divider());
     });
     return opciones;
  }
}