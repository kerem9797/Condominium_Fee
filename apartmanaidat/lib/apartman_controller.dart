
import 'package:get/get.dart';
import 'package:apartmanaidat/screens/veri_giris_ekrani.dart';

class ApartmanController extends GetxController{
static var aidatSayaci = 0.obs;


  // int get aidatSay {
  //   return verilerListesi.length;
  // }
  
  aidatSay() {
    aidatSayaci.value = ApartmanStream().verilerListesi.length;
  }

}