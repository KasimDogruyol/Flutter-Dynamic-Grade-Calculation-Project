import 'package:dinamik_not_ortalamasi/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/data_helper.dart';

class HarfDropdownWidget extends StatefulWidget{
  HarfDropdownWidget({required this.onHarfSecildi,Key? key}) : super(key: key);
  final Function onHarfSecildi;
  @override
  _HarfDropdownWidgetState createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double secilenHarfDegeri = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        value: secilenHarfDegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        onChanged: (deger){
          setState(() {
             secilenHarfDegeri = deger!;
             widget.onHarfSecildi(secilenHarfDegeri);
            
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHarfleriniGetir()
      )

    );
  }
}