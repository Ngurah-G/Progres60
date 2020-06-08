import 'package:flutter/material.dart';
//import  terlebih  dahulu  halaman  yang  diperlukan
import './detail_produk.dart';

//Top  Level/Root
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First  App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Daftar Produk")),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                    name: "VGOD",
                    description: "VGOD Elec 75W",
                    price: 450000,
                    image: "vgod.png",
                  ),
                ));
              },
              child: ProductBox(
                name: "VGOD",
                description: "VGOD Elec 75W",
                price: 450000,
                image: "vgod.png",
              ),
            ),
            new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => DetailProduk(
                      name: "Smoant",
                      description:
                          "Smoant Nano 75W",
                      price: 500000,
                      image: "smoant.png",
                    ),
                  ));
                },
                child: ProductBox(
                  name: "Smoant",
                  description: "Smoant Nano 75W",
                  price: 500000,
                  image: "smoant.png",
                )),
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                    name: "PICO",
                    description:
                        "authentic eleaf istick pico 75w",
                    price: 250000,
                    image: "pico.jpg",
                  ),
                ));
              },
              child: ProductBox(
                name: "PICO",
                description: "authentic eleaf istick pico 75w",
                price: 250000,
                image: "pico.jpg",
              ),
            ),
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                    name: "RX 2/3",
                    description: "Wismec RX 2/3 Mod 200W",
                    price: 350000,
                    image: "rx.jpg",
                  ),
                ));
              },
              child: ProductBox(
                name: "RX 2/3",
                description: "Wismec RX 2/3 Mod 200W",
                price: 350000,
                image: "rx.jpg",
              ),
            ),
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                    name: "Limitles",
                    description: "Limitless MOD 75W",
                    price: 300000,
                    image: "limitles.png",
                  ),
                ));
              },
              child: ProductBox(
                name: "Limitles",
                description: "Limitless MOD 75W",
                price: 300000,
                image: "limitles.png",
              ),
            ),
          ],
        ));
  }
}

//menggunakan  widget  StatelessWidget
class ProductBox extends StatelessWidget {
//deklarasi  variabel  yang  diterima  dari  MyHomePage
  ProductBox({Key key, this.name, this.description, this.price, this.image})
      : super(key: key);
//menampung  variabel  yang  diterima  untuk  dapat  digunakan  pada  class  ini
  final String name;
  final String description;
  final int price;
  final String image;

  Widget build(BuildContext context) {
//menggunakan  widget  container
    return Container(
//padding
        padding: EdgeInsets.all(2),
        //  height:  120,
        //menggunakan  widget  card
        child: Card(
            //membuat  tampilan  secara  horisontal  antar  image  dan  deskripsi
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //children  digunakan  untuk  menampung  banyak  widget
                children: <Widget>[
              Image.asset(
                "produklist/assets/appsimage/" + image,
                width: 150,
              ),
              Expanded(
                  //child  digunakan  untuk  menampung  satu  widget
                  child: Container(
                      padding: EdgeInsets.all(5),
                      //membuat  tampilan  secara  vertikal
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //ini  isi  tampilan  vertikal  tersebut
                        children: <Widget>[
                          //menampilkan  variabel  menggunakan  widget  text
                          Text(this.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(this.description),
                          Text(
                            "Harga:  " + this.price.toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                          //menampilkan  widget  icon    dibungkus  dengan  row
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                ],
                              )
                            ],
                          )
                        ],
                      )))
            ])));
  }
}
