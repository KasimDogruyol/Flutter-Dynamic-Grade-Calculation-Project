import 'package:dinamik_not_ortalamasi/constants/app_constants.dart';
import 'package:dinamik_not_ortalamasi/helper/data_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/model/ders.dart';

class DersListesi extends StatelessWidget{
  final Function onElemanCikarildi;
  const DersListesi({required this.onElemanCikarildi,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Ders>  tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0 ? ListView.builder(
      itemCount: tumDersler.length,
      itemBuilder: ((context, index) {
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.startToEnd,
          onDismissed: (a){
            onElemanCikarildi(index);
            // DataHelper.tumEklenenDersler.removeAt(index);
            
          },
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              child: ListTile(
                title: Text(tumDersler[index].ad),
                leading: CircleAvatar(
                  backgroundColor: Sabitler.anaRenk,
                  child: Text((tumDersler[index].harfDegeri * tumDersler[index].krediDegeri).toStringAsFixed(0)),
                ),
                subtitle: Text('${tumDersler[index].krediDegeri} Kredi, Not Değeri ${tumDersler[index].harfDegeri} '),
                
                trailing: Icon(Icons.delete),
              ),
            ),
          ),
        );
      }),
    ):Container(
      child: Center(
        child: Text('Henüz ders eklenmedi',style: Sabitler.baslikStyle,),
      ),
    ) ;
  }
}