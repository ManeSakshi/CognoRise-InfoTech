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
  late int firstnum;
  late int secondnum;
  String texttodisplay = "";
  late String res;
  late String operatortoperform;
  String inputText = '';
  String outputText = '';

  void btnclicked(String btnval) {
    setState(() {
      if (btnval == 'C') {
        texttodisplay = "";
        inputText = "";
        firstnum = 0;
        secondnum = 0;
        res = "";
        outputText = "";
      } else if (btnval == '+' || btnval == '-' || btnval == 'x' || btnval == '/') {
        firstnum = int.tryParse(texttodisplay) ?? 0;
        res = "";
        operatortoperform = btnval;
        inputText += btnval;
      } else if (btnval == '=') {
        secondnum = int.tryParse(texttodisplay) ?? 0;
        if (operatortoperform == '+') {
          res = (firstnum + secondnum).toString();
        } else if (operatortoperform == '-') {
          res = (firstnum - secondnum).toString();
        } else if (operatortoperform == 'x') {
          res = (firstnum * secondnum).toString();
        } else if (operatortoperform == '/') {
          res = (firstnum / secondnum).toString();
        }
        outputText = res;
      } else {
        res = (int.tryParse(texttodisplay + btnval) ?? 0).toString();
        inputText += btnval;
      }
      texttodisplay = res;
    });
  }


  Widget custombutton(String btnval){
    return Expanded(

      child: Container(
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0x2B2B6231)),
          color: Color(0x2B2B6231), // Set border color here
        ),
        child: MaterialButton(
          onPressed: () => btnclicked(btnval),
          color: Colors.black12,
          child: Center(child: Text('$btnval',style: TextStyle(color: Colors.white,fontSize: 30),)),
        ),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Calculator",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      inputText,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      outputText,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                custombutton('9'),
                custombutton('8'),
                custombutton('7'),
                custombutton('+'),
              ],
            ),
            Row(
              children: [
                custombutton('6'),
                custombutton('5'),
                custombutton('4'),
                custombutton('-'),
              ],
            ),
            Row(
              children: [
                custombutton('3'),
                custombutton('2'),
                custombutton('1'),
                custombutton('x'),
              ],
            ),
            Row(
              children: [
                custombutton('C'),
                custombutton('0'),
                custombutton('='),
                custombutton('/'),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
