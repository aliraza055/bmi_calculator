import 'package:flutter/material.dart';

class Calculation  with ChangeNotifier{
  GlobalKey<FormState> keyfrom=GlobalKey<FormState>();
 TextEditingController ageController=TextEditingController();
  TextEditingController heightFtController=TextEditingController();
 TextEditingController heightInController=TextEditingController();
 TextEditingController weightController=TextEditingController();
 double _bmi=0;
 double get bmi =>_bmi;
 String _result='';
 String get result => _result;
 
 void bmiCalculate(){
  if (ageController.text.isEmpty || heightFtController.text.isEmpty || heightInController.text.isEmpty || weightController.text.isEmpty) {
    _bmi=0;
    notifyListeners();
    return;
  }  else{
  double heightFt=double.parse(heightFtController.text);
  double heightIn=double.parse(heightInController.text);
  double weight=double.parse(weightController.text);
   heightIn=(12*heightFt)+heightIn;
  double totalCm=2.54*heightIn;
  double totalm=totalCm/100;
     _bmi=weight/(totalm*totalm);
     if(_bmi>0 && _bmi <=18.5){
      _result='Under Weight';
     }else if(_bmi <=24.5){
      _result='Normal Weight';
     }else{
      _result='Over Weight';
     }
           notifyListeners();
     }
   }
 }

