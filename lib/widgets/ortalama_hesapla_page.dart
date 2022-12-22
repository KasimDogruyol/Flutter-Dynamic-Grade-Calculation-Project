import 'package:dinamik_not_ortalamasi/constants/app_constants.dart';
import 'package:dinamik_not_ortalamasi/constants/model/ders.dart';
import 'package:dinamik_not_ortalamasi/helper/data_helper.dart';
import 'package:dinamik_not_ortalamasi/widgets/ders_listesi.dart';
import 'package:dinamik_not_ortalamasi/widgets/harf_dropdown_widgets.dart';
import 'package:dinamik_not_ortalamasi/widgets/kredi_dropdown_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ortalama_goster.dart';

class OrtalamaHesapla extends StatefulWidget {
  OrtalamaHesapla({Key? key}) : super(key: key);
  @override
  _OrtalamaHesaplaState createState() => _OrtalamaHesaplaState();
}

class _OrtalamaHesaplaState extends State<OrtalamaHesapla> {
  List<Ders> tumDersler = [];
  
  double secilen = 1;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = '';
  double krediDegeri = 1;
  double secilenHarfDegeri = 4;
  

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'Ortalama Hesapla',
            style: Sabitler.baslikStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            
            children: [
              Expanded(flex: 2, child: _buildForm()),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                  dersSayisi: DataHelper.tumEklenenDersler.length,
                  ortalama: DataHelper.ortalamaHesapla(),
                ),
              )
            ],
          ),
          Expanded(
            child: DersListesi(
              onElemanCikarildi: (index){
                DataHelper.tumEklenenDersler.removeAt(index);
                setState(() {
                  
                });
              }
            ),
          )
        ],
      ),
    );
  }
  Widget _buildForm(){
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(padding: Sabitler.yatayPadding8,
          child: _buildTextFormField(),
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding:Sabitler.yatayPadding8,
                  child: HarfDropdownWidget(
                    onHarfSecildi: (harf){
                      secilenHarfDegeri = harf;
                    }
                  )
                ),
              ),
              Expanded(child: Padding(
                padding:Sabitler.yatayPadding8,
                child: KrediDropdownWidget(
                  onKrediSecildi: (kredi){
                    secilenKrediDegeri = kredi;
                  }
                ),
              )),
              IconButton(onPressed: _dersEkleveOrtalamaHesapla,
               icon: Icon(Icons.arrow_forward_ios_sharp),
               color: Sabitler.anaRenk,
               iconSize: 30,
               ),
            ],
          ),
          SizedBox(height: 5,),
          
        ],
      ),
    );
  }

  _buildTextFormField(){
    return TextFormField(
      onSaved: (deger){
        setState(() {
          girilenDersAdi = deger!;
        });
        
      },
      validator: (s){
        if(s!.length <= 0){
          return 'Ders adı boş olamaz';
        }else{
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Matematik',
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide(color: Sabitler.anaRenk, width: 2),
        ),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3),
    ),
    );
  }
  void _dersEkleveOrtalamaHesapla () {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      var eklenecekDers = Ders(
        ad: girilenDersAdi,
        harfDegeri: secilenHarfDegeri,
        krediDegeri: secilenKrediDegeri
      );
      
      setState(() {
        
      });
    }
  }

}
                