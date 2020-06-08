import 'package:apps_ngurah/beranda.dart';
import 'package:apps_ngurah/tambahData.dart';
import 'package:apps_ngurah/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apps_ngurah/main.dart';

class Berandauser extends StatefulWidget {
  @override
  _BerandauserState createState() => _BerandauserState();
}

class SharedPreferences {
  void setInt(String s, int i) {}

  String getString(String s) {}

  int getInt(String s) {}

  static getInstance() {}
}

class _BerandauserState extends State<Berandauser> {
  String id;
  String nama;
  String email;
  String photo;
  List penjualanList;
  int level = 0;
  final Color _buttonColorWhite = Colors.white;
  final Color _buttonHighlightColor = Colors.grey[800];
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      level = preferences.getInt("level");
      id = preferences.getString("id");
      email = preferences.getString("email");
      nama = preferences.getString("nama");
      photo = preferences.getString("photo");
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("level", 0);
    });
    Navigator.pushNamed(context, '/login');
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (level) {
      case 1:
        return MyHomePage();
        break;
      case 2:
        return Scaffold(
          appBar: new AppBar(
            title: new Text("Beranda"),
          ),
          drawer: new Drawer(
            child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text("$nama"),
                  accountEmail: new Text("$email"),
                  currentAccountPicture: new GestureDetector(
                    onTap: () {},
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage(
                          'http://192.168.72.13/appPenjualan/media/photo/$photo'),
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/appimages/profile.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                new ListTile(
                  title: new Text('logout'),
                  trailing: new Icon(Icons.settings),
                  onTap: () {
                    signOut();
                  },
                ),
              ],
            ),
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset("assets/appimages/penjualan.jpg"),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: new BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xff3164bd),
                        const Color(0xff295cb5)
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        "April",
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontFamily: "NeoSansBold"),
                      ),
                      new Container(
                        child: new Text(
                          "Rp. 120.000",
                          style: new TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontFamily: "NeoSansBold"),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    child: new Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: _buttonColorWhite,
                          highlightColor: _buttonHighlightColor,
                          padding: EdgeInsets.all(10),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset('assets/appimages/taks.png',
                                  width: 40),
                              new Text(
                                "Tambah",
                                style: new TextStyle(
                                    fontSize: 10, color: Colors.red),
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new tambahData()),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: _buttonColorWhite,
                          highlightColor: _buttonHighlightColor,
                          padding: EdgeInsets.all(10),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset('assets/appimages/list.png',
                                  width: 40),
                              new Text(
                                "Penjualan",
                                style: new TextStyle(
                                    fontSize: 10, color: Colors.red),
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new MyHomePage(),
                            ));
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: _buttonColorWhite,
                          highlightColor: _buttonHighlightColor,
                          padding: EdgeInsets.all(10),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset('assets/appimages/pelanggan.png',
                                  width: 40),
                              new Text(
                                "Pelanggan",
                                style: new TextStyle(
                                    fontSize: 10, color: Colors.red),
                              )
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: _buttonColorWhite,
                          highlightColor: _buttonHighlightColor,
                          padding: EdgeInsets.all(10),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset('assets/appimages/jadwal.png',
                                  width: 40),
                              new Text(
                                "Laporan",
                                style: new TextStyle(
                                    fontSize: 10, color: Colors.red),
                              )
                            ],
                          ),
                          onPressed: () {},
                        ),
                      )
                    ]),
                  ],
                ))
              ],
            ),
          ),
        );
      case 0:
        return Login();
        break;
    }
  }
}
