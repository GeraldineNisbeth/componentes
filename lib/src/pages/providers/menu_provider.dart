import 'package:flutter/services.dart' show rootBundle; //para leer el json

import 'dart:convert';

class _MenuProvider{

  List<dynamic> opciones = [];

  _MenuProvider(){
    cargarData();
  }

  Future<List<dynamic>>cargarData() async{
    /*
    rootBundle.loadString('data/menu_opts.json')
    .then((data){
      //Conviritendo el json en objeto json
      Map dataMap = json.decode(data);
      print(dataMap['rutas']);
      opciones = dataMap['rutas'];
    });*/
    final resp = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(resp);
    opciones = dataMap['rutas'];
      
    return  opciones;
  }

}

final menuProvider = new _MenuProvider();