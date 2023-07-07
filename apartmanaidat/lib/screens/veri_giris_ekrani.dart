
import 'package:apartmanaidat/apartman_controller.dart';
import 'package:apartmanaidat/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

final _firestore = FirebaseFirestore.instance;

class VeriGirisEkrani extends StatefulWidget {
 
  @override
  State<VeriGirisEkrani> createState() => _VeriGirisEkraniState();
}

class _VeriGirisEkraniState extends State<VeriGirisEkrani> {

  String daireNoText ="";
  String kisiText = "";
  String aidatText = "";

  final daireNoTextController = TextEditingController();
  final kisiTextController = TextEditingController();
  final aidatTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: kContainerDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Daire No",
                textAlign: TextAlign.center,
                style: kTextTextStyle,
              ),
              kSizedBox10,
              TextField(
                controller: daireNoTextController,
                onChanged: (value) {
                  //daireNoText = int.parse(value);
                  daireNoText = (value);
                },
                autofocus: false,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration,
              ),
              kSizedBox20,
              Text(
                "Ad ve Soyad",
                textAlign: TextAlign.center,
                style: kTextTextStyle,
                ),
                kSizedBox10,
              TextField(
                controller: kisiTextController,
                onChanged: (value) {
                  kisiText = value;
                },
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration,
              ),
              kSizedBox20,
              Text(
                "Aidat (TL)",
                textAlign: TextAlign.center,
                style: kTextTextStyle,
              ),
              kSizedBox10,
              TextField(
                controller: aidatTextController,
                onChanged: (value) {
                  //aidatText = int.parse(value);
                  aidatText = (value);
                },
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration,
              ),
              kSizedBox20,
              ElevatedButton(
                onPressed: (){
                  daireNoTextController.clear();
                  kisiTextController.clear();
                  aidatTextController.clear();
                  _firestore.collection("apartman").add({
                    "daireNo": daireNoText,
                    "kisi": kisiText,
                    "aidat": aidatText,
                  });
                },
                child:Text(
                  "Ekle",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                  shadowColor: Colors.black,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ApartmanStream extends StatelessWidget {
  List<Row> verilerListesi = [];

  ApartmanStream({super.key});

  

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection("apartman").snapshots(),
      builder:(context,snapshot){
        //List<Row> verilerListesi = [];
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
            ),
          );
        }
        else{
          final veriler = snapshot.data?.docs.reversed;
          for(var veri in veriler!){
            final veriListesi = Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  veri ["daireNo"],
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  veri ["kisi"],
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  veri ["aidat"],
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                IconButton(
                  onPressed: (){
                    var collection = _firestore.collection("apartman");
                    collection.doc(veri.id).delete();
                  }, 
                  icon: Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            );
            verilerListesi.add(veriListesi);
          }
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
            children: verilerListesi,
          ),
        );
      }
    );
  }
}

