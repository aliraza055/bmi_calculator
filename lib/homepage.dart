import 'package:bmi_calculator/calculation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<Calculation>(context,listen: false);

    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title:const Text('BMI Calculator',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
       decoration:const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFFa8edea),
          Color(0xFFfed6e3)
        ])
       ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 80, 30, 60),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)
            ),
            child: Padding(
              padding:const EdgeInsets.all(16),
              
              child:Consumer<Calculation>(builder: (context,value,child){
                return Form(
                key: provider.keyfrom,
                child: Column(
                  children: [
                const  Align(
                    alignment: Alignment.centerLeft,
                    child:  Text('Age:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),)),
                    TextFormField(
                      controller: provider.ageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(8) 
                        ),
                        hintText: 'Enter age'
                      ),
                      keyboardType:TextInputType.number,
                    ),
                  const  SizedBox(height: 20,),
                  const  Align(
                    alignment: Alignment.centerLeft,
                    child:  Text('Height:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),)),
                    Row(
                      children: [
                    Expanded(
                      child: TextFormField(  
                        controller: provider.heightFtController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(8) 
                          ),
                          hintText: 'Enter Feet'
                        ),
                        keyboardType:TextInputType.number,
                      ),
                    ),
                    const  SizedBox(width: 20,),
                    Expanded(
                      child: TextFormField(
                        controller: provider.heightInController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(8) 
                          ),
                          hintText: 'Enter Inches'
                        ),
                        keyboardType:TextInputType.number,
                      ),
                    ),
                      ],
                    ),
                    const  SizedBox(height: 20,),
                    const  Align(
                    alignment: Alignment.centerLeft,
                    child:  Text('Weight:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),)),
                     TextFormField(
                      controller: provider.weightController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(8) 
                          ),
                          hintText: 'Enter Weight in kg'
                        ),
                        keyboardType:TextInputType.number,
                      ),
                     const  SizedBox(height: 25,),
                     InkWell(
                     onTap: (){
                       value.bmiCalculate();
                       FocusScope.of(context).unfocus();  
                     },
                      child: Container(
                       height: 55,
                       decoration: BoxDecoration(
                         color: Colors.blue.shade300,
                         borderRadius: BorderRadius.circular(8)
                       ),
                       child:const Center(
                         child: Text('Calculate',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
                       ),
                      ),
                                          ) ,
                  const   SizedBox(height: 20,),
                 const  Align(
                    alignment: Alignment.centerLeft,
                    child:   Text('BMI:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    Align(
                     alignment: Alignment.centerLeft,
                      child: value.bmi>0 ?
                      Text(value.bmi.toStringAsFixed(2)) : const Text('Enter you detail to calculate BMI'),
                    ),
                    const  Align(
                    alignment: Alignment.centerLeft,
                    child:   Text('Result:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                     Align(
                      alignment: Alignment.centerLeft,
                      child: value.bmi>0 ?
                      Text(value.result.toString() ) : const Text('No result yet'),
                    ),

                  ],
                ),
              );
              })
               
            ),
          ),
        ),
      ),
    );
  }
}