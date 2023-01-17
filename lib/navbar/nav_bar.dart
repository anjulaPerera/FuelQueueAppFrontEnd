import 'package:flutter/material.dart';


class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Fuel Queue Handler'),
            accountEmail: Text(''),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image(image: AssetImage('assets/logo.jpg'), width: 90, height: 90,)
                // Image.network(
                //   'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                //   fit: BoxFit.cover,
                //   width: 90,
                //   height: 90,
                // ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn5.vectorstock.com%2Fi%2F1000x1000%2F39%2F34%2Fqueue-of-cars-at-the-gas-station-filling-vector-24043934.jpg&imgrefurl=https%3A%2F%2Fwww.vectorstock.com%2Froyalty-free-vector%2Fqueue-of-cars-at-the-gas-station-filling-vector-24043934&tbnid=YxvG057RRN9-xM&vet=12ahUKEwi1_feZ_sn8AhWrndgFHQzhCZYQMygFegUIARDXAQ..i&docid=xyFe1JGcYUhoIM&w=1000&h=780&q=vehicle%20queue&client=opera&ved=2ahUKEwi1_feZ_sn8AhWrndgFHQzhCZYQMygFegUIARDXAQ')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Nearest Location'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.local_gas_station_rounded),
            title: Text('Fuel Status'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.garage),
            title: Text('Queue Status'),
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (builder){
              //   return Homescreen();
              // }));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
