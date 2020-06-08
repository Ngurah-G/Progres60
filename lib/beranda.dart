import 'package:flutter/material.dart';

import './detail_akun.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text('Beranda'),
        ]),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Click  search');
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: () {
              print('Click  start');
            },
          ),
        ],
      ),
//widget  Drawer
      drawer: new Drawer(
//menggunakan  listView  agar  drawer  dapat  melebihi  width  devices
        child: new ListView(
          children: <Widget>[
//Drawer  Header  diisi  dengan  informasi  akun
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailAkun(
                    accountName: "Ngurah Gede",
                    accountEmail: "ngurah.arya@unduksha.ac.id",
                    backgroundImage: "profil.jpg",
                  ),
                ));
              },
              child: UserAccountsDrawerHeader(
                accountName: new Text("Ngurah Gede"),
                accountEmail: new Text("ngurah.arya@unduksha.ac.id"),
                currentAccountPicture: new GestureDetector(
                  onTap: () {},
                  child: new CircleAvatar(
                    backgroundImage: AssetImage('assets/appimages/profil.jpg'),
                  ),
                ),
//memberi  background  pada  Drawer  Header
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/appimages/logo.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
//Menu  Drawer
            new ListTile(
              title: new Text('Pemberitahuan'),
              trailing: new Icon(Icons.notifications_none),
            ),
            new ListTile(
              title: new Text('Wishlist'),
              trailing: new Icon(Icons.bookmark_border),
            ),
            new ListTile(
              title: new Text('Akun'),
              trailing: new Icon(Icons.verified_user),
            ),
//Divider  Menu
            Divider(
              height: 2,
            ),

            new ListTile(
              title: new Text('Setelan'),
              trailing: new Icon(Icons.settings),
            ),
          ],
        ),
      ),

      //seluruh body dibungkus column
      body: new Column(
        children: <Widget>[
          Image.asset("assets/appimages/logo.jpg"),
          //setiap bagian body dipisahkan container
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(10),
            //untuk membuat tampilan secara horizontal maka digunakan row
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'KHARISMA JAYA Vapor',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        'Ayo Kunjungi!',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.inbox,
                  color: Colors.white
                ),
                Text('63'),
              ],
            ),
          ),
          //setiap bagian pada body dipisahkan container
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor)),
            ),
            //untuk membuat tampilan secara horizontal maka gunkan row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //untuk membuat tampilan secara vertikal maka digunakan column
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.info, color: Colors.blue),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "TENTANG",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.trip_origin, color: Colors.blue),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "VAPE",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on, color: Colors.blue),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "LOKASI",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.share, color: Colors.blue),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "BAGIKAN",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
