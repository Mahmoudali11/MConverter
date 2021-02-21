import 'package:flutter/material.dart';
const style=TextStyle(fontSize: 26,color:Colors.blue);
const dropButtonStyle=TextStyle(fontSize: 18,color:Colors.greenAccent);

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
       
      ),
      home:MyHomePage()
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final List<String> measures = [
 'meters',
 'kilometers',
 'grams',
 'kilograms',
 'feet',
 'miles',
 'pounds (lbs)',
 'ounces',
];
  final Map<String, int> measuresMap = {
 'meters' : 0,
 'kilometers' : 1,
 'grams' : 2,
 'kilograms' : 3,
 'feet' : 4,
 'miles' : 5,
 'pounds (lbs)' : 6,
 'ounces' : 7,
};
 final dynamic formula = {
'0':[1,0.001,0,0,3.28084,0.000621371,0,0],
'1':[1000,1,0,0,3280.84,0.621371,0,0],
'2':[0,0,1,0.001,0,0,0.00220462,0.035274],
'3':[0,0,1000,1,0,0,2.20462,35.274],
'4':[0.3048,0.0003048,0,0,1,0.000189394,0,0],
'5':[1609.34, 1.60934,0,0,5280,1,0,0],
'6':[0,0,453.592,0.453592,0,0,1,16],
'7':[0,0,28.3495,0.0283495,3.28084,0,0.0625, 1],
 };
 String result;

  var st='miles';
  var value=0.0;
  var second='kilometers';
  var convValue=0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Ms Converter"), centerTitle: true,),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView (
                  child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
               //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
           // Spacer(),
           SizedBox(height:20),
            Text("Value",textAlign: TextAlign.center,style: style,),
            SizedBox(height:20),
            //Spacer(),
            TextField(keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "please enter vlaut to be converted"),
            
            onChanged:(String text){
               var v=double.tryParse(text);
               if(v!=null){
             setState(() {
             value=v;
             });
               }



              },),
              SizedBox(height:20),
             // Spacer(),
              Text("From",textAlign: TextAlign.center,style: style,),
              SizedBox(height:20),
            //  Spacer(),
            Center(child: buildDropdownButton(1)),
            SizedBox(height:20),
           // Spacer(),
             Text("To",textAlign: TextAlign.center,style: style,)
             ,
             SizedBox(height:20),
             //Spacer(),
             Center(child: buildDropdownButton(2)),
           SizedBox(height:40),
             //Spacer(),
             RaisedButton(onPressed: (){

                var indexOfFirst= measuresMap[st];
                var indexOfSecond=measuresMap[second];
                var maultiplyValue=formula[indexOfFirst.toString()][indexOfSecond];
                if(maultiplyValue==0)
                  result="invalid";
                  else
                  result='';
                setState(() {
                   
                   if(result!='invalid')
                   result=(maultiplyValue*value).toString();
                   

                });

             },child: Text("Convert"),),
            // Spacer(),
             
              Text((result!=null)?'Result: $result':'',textAlign: TextAlign.center,style: style,),
         //    Spacer(flex: 4,)
              
              
               ],
            ),
          ),
        ),
      ),

    ) ;
  }

  DropdownButton<String> buildDropdownButton(int v) {
    return DropdownButton(
      isExpanded: true,
       style: dropButtonStyle,
      items:measures.map((String val) {
               return DropdownMenuItem<String>(child: Text(val,),value: val,);

             } ).toList(), onChanged:(valt){
             setState(() {
               if(v==1)
            st=valt;
            else{
              second=valt;
            }
             });   
             },
             value:(v==1)? st:second,
             );
  }
}