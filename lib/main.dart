import 'package:dinamik_not_ortalamasi/constants/app_constants.dart';
import 'package:dinamik_not_ortalamasi/widgets/ortalama_hesapla_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Dinamik Ortalama Hesaplayıcı',
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk, //constants/app_constants.dart içinde sabit değişkenlerimizi yazdık bu orada var
        visualDensity: VisualDensity.adaptivePlatformDensity, // diğer ortamlarda da o ortama uyhun şekilde görümesini sağla
      ),
      home: OrtalamaHesapla()
        
        );
      
    
  }
}