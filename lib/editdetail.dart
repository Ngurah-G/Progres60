import 'package:apps_ngurah/catatan.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import './catatan.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerNama;
  TextEditingController controllerProduk;
  TextEditingController controllerHarga;
  TextEditingController controllerTanggal;
  final format = DateFormat('yyyy-MM-dd');

  void editData() {
    var url =
        "http://192.168.72.13/appPenjualan/index.php/App_penjualan/simpan_update";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "nama": controllerNama.text,
      "produk": controllerProduk.text,
      "harga": controllerHarga.text,
      "tanggal": controllerTanggal.text,
    });
  }

  @override
  void initState() {
    controllerNama =
        new TextEditingController(text: widget.list[widget.index]['nama']);
    controllerProduk =
        new TextEditingController(text: widget.list[widget.index]['produk']);
    controllerHarga =
        new TextEditingController(text: widget.list[widget.index]['harga']);
    controllerTanggal =
        new TextEditingController(text: widget.list[widget.index]['tanggal']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: new Text("EDIT DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                    controller: controllerNama,
                    decoration: new InputDecoration(
                        hintText: "Nama", labelText: "Nama Pembeli")),
                new TextField(
                    controller: controllerProduk,
                    decoration: new InputDecoration(
                        hintText: "Produk", labelText: "Nama Produk")),
                new TextField(
                    controller: controllerHarga,
                    decoration: new InputDecoration(
                        hintText: "Harga", labelText: "Harga")),
                new DateTimeField(
                    controller: controllerTanggal,
                    format: format,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          initialDate: currentValue ?? DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2045));
                    },
                    decoration: new InputDecoration(
                        hintText: "Tanggal", labelText: "Tanggal pembelian")),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Ok"),
                  color: Colors.grey,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Catatan()));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  static DateFormat(String s) {}
}
