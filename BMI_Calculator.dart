import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = " ";
  var bgcolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('BMI Calculator'),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  SizedBox(height: 10.0),
                  Center(
                    child: Text('Welcome',style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                        fontSize: 30),
                    ),
                  ),

                  SizedBox(height: 25.0),

                  TextField(
                    controller: wtController,
                    decoration:InputDecoration(
                      label: Text("Enter your Weight in Kg"),
                      prefixIcon: Icon(Icons.line_weight),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),

                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 12.0),

                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                      label: Text("Enter your Height in Feet"),
                      prefixIcon: Icon(Icons.height),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 12.0),

                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                      label: Text("Enter your Height in Inches"),
                      prefixIcon: Icon(Icons.height),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 25.0),

                  MaterialButton(
                    onPressed:(){
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if(wt != "" && ft !="" && inch != ""){

                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iinch = int.parse(inch);

                        var tinch = (ift * 12) + iinch;

                        var tcm = tinch * 2.54;

                        var tm = tcm/100;

                        var bmi = iwt / (tm * tm);

                        var msg = " ";

                        if(bmi > 25){

                          msg = "OverWeight";
                          bgcolor = Colors.red;

                        }else if(bmi <18){

                          msg = "UnderWeight";
                          bgcolor = Colors.orange;

                        }else{

                          msg = "Healthy";
                          bgcolor = Colors.green;
                        }

                        setState(() {
                          result = "        $msg \n Your BMI is ${bmi.toStringAsFixed(2)}";
                        });

                      } else{
                        setState(() {
                          result = "Please fill all required lines";
                        });
                      }
                    },
                    color: Colors.blue,
                    child: Text("Calculate",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black),),
                  ),
                  SizedBox(height: 25.0),
                  Text(result,style: TextStyle(fontSize: 20,color: Colors.black),),
                ]
            ),
          ),
        ),
      ),
    );
  }

}
