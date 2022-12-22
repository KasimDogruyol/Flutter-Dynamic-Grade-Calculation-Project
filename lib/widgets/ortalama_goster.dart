import 'package:dinamik_not_ortalamasi/constants/app_constants.dart';
import 'package:flutter/material.dart';
class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;

  const OrtalamaGoster({required this.ortalama,required this.dersSayisi, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        Text(dersSayisi >0 ? '$dersSayisi Ders Seçildi' : 'Ders Seçiniz',
        style: Sabitler.ortalamaGosterBodyStyle,
        ),
        Text(ortalama >=0 ? '${ortalama.toStringAsFixed(2)}' : '0.0', //toStringAsFixed(2) virgülden sonra 2 basamak göster demek
        style: Sabitler.ortalamaStyle,),
        Text("Ortalama",
        style: Sabitler.ortalamaGosterBodyStyle,)
      ]
      
    );
  }
}