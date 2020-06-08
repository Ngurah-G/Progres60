import 'package:apps_ngurah/berandauser.dart';
import 'package:flutter/material.dart';
//import  halaman  yang  akan  diload  kemudian  beri  alias
import './beranda.dart' as beranda;
import './listproduk.dart' as listproduk;
import './catatan.dart' as catatan;
import './login.dart';
import './berandauser.dart';

//Top  Level/Root
void main() {
runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
    routes: <String,WidgetBuilder>{
      '/pages/home': (BuildContext context)=> new beranda.MyHomePage(),
      '/pages/admin': (BuildContext context)=> new Berandauser(),
      '/pages/login': (BuildContext context)=> new Login(),
    },
  ));
}

//jangan  lupa  menggunakan  StatefulWidget
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

//jangan  lupa  panggil  juga  SingleTickerProviderStateMixin
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
//ini  variabel  controller  untuk  mengatur  tabbar
  TabController controller;
//jangan  lupa  tambahkan  initState  untuk  inisialisasi  dan  mengaktifkan  tab
  @override
  void initState() {
    controller = new TabController(vsync: this, length: 3);
    super.initState();
  }

//dispose  untuk  berpindah  halaman
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//gunakan  widget  Scaffold
    return Scaffold(
//widget  TabBarView
        body: new TabBarView(
//terdapat  controller  untuk  mengatur  halaman
          controller: controller,
          children: <Widget>[
//pemanggilan  halaman  dimulai  dari  alias.className  halaman  yang  diload
            new beranda.MyHomePage(),
            new listproduk.MyHomePage(),
            new catatan.Catatan(),
          ],
        ),
//membuat  bottom  tab
        bottomNavigationBar: new Material(
          color: Colors.blue,
          child: new TabBar(
            controller: controller,
            tabs: <Widget>[
//menggunakan  icon  untuk  mempercantik  nama  tab
//icon  berurutan  sesuai  pemanggilan  halaman
              new Tab(icon: new Icon(Icons.home)),
              new Tab(icon: new Icon(Icons.list)),
              new Tab(icon: new Icon(Icons.info))
            ],
          ),
        ));
  }
}
