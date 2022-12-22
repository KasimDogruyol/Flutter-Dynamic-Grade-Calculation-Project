import 'package:dinamik_not_ortalamasi/constants/model/ders.dart';
import 'package:flutter/material.dart';

class DataHelper {

  static List<Ders> tumEklenenDersler = [];

  static dersEkle(Ders ders){
    tumEklenenDersler.add(ders);
  }


  static double ortalamaHesapla(){
    double toplamNot = 0;
    double toplamKredi = 0;
    tumEklenenDersler.forEach((element) {
      toplamNot += element.harfDegeri * element.krediDegeri;
      toplamKredi += element.krediDegeri;
    });

    return toplamNot / toplamKredi;
  }


  static List<String> _tumDerslerinHarfleri(){
    return ["AA","BA","BB","CB","CC","DC","DD","FD","FF"];
  }
  
  static double _harfiNotaCevir(String harf){
    switch(harf){
      case "AA": return 4;
      case "BA": return 3.5;
      case "BB": return 3;
      case "CB": return 2.5;
      case "CC": return 2;
      case "DC": return 1.5;
      case "DD": return 1;
      case "FD": return 0.5;
      case "FF": return 0;
      default: return 0;
    }
  }
  static List<DropdownMenuItem<double>> tumDerslerinHarfleriniGetir(){
   return _tumDerslerinHarfleri().map((e) => DropdownMenuItem<double>(
     child: Text(e),
     value: _harfiNotaCevir(e),
   )).toList();
  }
  static List<int> tumkrediDegerleri(){
    return List.generate(10, (index) => index+1).toList();
  }

  static List<DropdownMenuItem<double>> tumDerslerinKredileri(){
    return tumkrediDegerleri().map((e) => DropdownMenuItem<double>(
      child: Text(e.toString()),
      value: e.toDouble(),
    )).toList();
  }
}