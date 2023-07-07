import 'package:apartmanaidat/apartman_controller.dart';
import 'package:apartmanaidat/screens/veri_giris_ekrani.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AnaEkrani extends StatelessWidget {
  final ApartmanController apartmanController = Get.put(ApartmanController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder:(context) => VeriGirisEkrani());
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.add,color: Colors.black,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60.0,left: 30.0,right: 30.0,bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.home,
                    color: Colors.grey,
                    size: 30.0,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(height: 10.0,),
                Text(
                  "Aidat Listesi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // Obx((){
                //   return Text(
                //     ApartmanController.aidatSayaci.value.toString(),
                //     style: TextStyle(
                //     fontSize: 20,
                //     ),
                //     );
                // },),
              ],
            ),
          ),
          ApartmanStream(),
        ],
      ),
    );
  }
}
