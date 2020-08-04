import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  Drawer getDrawer(BuildContext context){

    var header = DrawerHeader(
      child: Text('Ajustes')
    );

    var information = AboutListTile(
      child: Text('Información App'),
      applicationIcon: Icon(Icons.favorite),
      applicationVersion: 'V1.0.0.',
      icon: Icon(Icons.info)
    );

    return Drawer(child: getList(header, context,information));
  }
  
  
  ListTile getItem(Icon icon, String description,  String routeName, BuildContext context){
    return ListTile(
      leading: icon,
      title: Text(description),
      //Navegación entre rutas
      onTap: (){
        Navigator.pushNamed(context, routeName);
      },
    );
  }
  
  ListView getList( DrawerHeader header, BuildContext context,  AboutListTile information){
    return ListView(
      children: <Widget>[
        header,
        getItem(Icon(Icons.settings), 'Configuración','/settings',context),
        getItem(Icon(Icons.home), 'Pagina principal','/',context ),
        getItem(Icon(Icons.battery_charging_full), 'Batería', '/battery',context),
        information
      ],
    );
  }

  String title = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.blueAccent),
      drawer: Drawer(
        child: getDrawer(context),
      ),
    );
  }
}
