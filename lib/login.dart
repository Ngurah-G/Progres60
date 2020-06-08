import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class SharedPreferences {
  static getInstance() {}

  void setString(String s, String nama) {}

  void setInt(String s, int level) {}
}

class _MyHomePageState extends State<Login> {
  TextEditingController usr = new TextEditingController();
  TextEditingController psw = new TextEditingController();
  String msg = '';
  Future<String> _login() async {
    final response = await http.post(
        "http://192.168.72.13/appPenjualan/index.php/login/login_api",
        body: {
          "username": usr.text,
          "password": psw.text,
        });
    var datauser = json.decode(response.body);
    if (datauser['error'] == true) {
      setState(() {
        msg = datauser['msg'];
      });
    } else {
      String emailAPI = datauser['email'];
      String namaAPI = datauser['nama'];
      String id = datauser['id'];
      String photo = datauser['photo'];
      int level = int.parse(datauser['level']);
      setState(() {
        savePref(emailAPI, namaAPI, id, level, photo);
      });
      Navigator.pushReplacementNamed(context, '/Berandauser');
    }
  }

  savePref(
      String email, String nama, String id, int level, String photo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("nama", nama);
      preferences.setString("email", email);
      preferences.setString("id", id);
      preferences.setInt("level", level);
      preferences.setString("photo", photo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: new BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/appimages/bg_login.png'),
          fit: BoxFit.cover,
        )),
        child: new ListView(
          children: <Widget>[
            new Container(
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  new Image.asset(
                    'assets/appimages/logo.png',
                    width: 100,
                  ),
                  new Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        new TextField(
                          controller: usr,
                          decoration: InputDecoration(
                              hintText: "Username",
                              labelText: "Username",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        new Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        new TextField(
                          obscureText: true,
                          controller: psw,
                          decoration: InputDecoration(
                              hintText: "Password",
                              labelText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        new Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        new RaisedButton(
                          child: new Row(
                            children: <Widget>[
                              new Icon(Icons.verified_user),
                              new Text(" Login")
                            ],
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            _login();
                          },
                        ),
                        new Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        Text(
                          msg,
                          style: new TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
