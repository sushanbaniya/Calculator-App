import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int firstnum;
  int secondnum;
  String texttodisplay = '';
  String res;
  String operationtoperform;

  void btnclicked(btntext){

    if (btntext == 'C'){
      texttodisplay = '';
      firstnum = 0;
      secondnum = 0;
      res = '';
    }

    else if (btntext == '+' || btntext == '-' || btntext == 'x' || btntext == '/' ){
      firstnum = int.parse(texttodisplay);
      operationtoperform = btntext;
      res = '';
    }
    else if (btntext == '='){
      secondnum = int.parse(texttodisplay);

      if (operationtoperform == '+'){
        res = (firstnum + secondnum).toString();
      }
      if (operationtoperform == '-'){
        res = (firstnum - secondnum).toString();
      }
      if (operationtoperform == 'x'){
        res = (firstnum * secondnum).toString();
      }
      if (operationtoperform == '/'){
        res = (firstnum ~/ secondnum).toString();
      }
    }
    else {
      res = int.parse(texttodisplay + btntext).toString();
    }

    setState((){
      texttodisplay = res;
    });




  }

  Widget custombutton(String btnval) {
      return Expanded(
        child: OutlineButton(
          padding: EdgeInsets.all(30),
          onPressed: () => btnclicked(btnval),
          child: Text('$btnval',
          style: TextStyle(
            fontSize: 30,
          )),
        ),
      );
    }

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
        appBar: AppBar(title: Text('Calculator')),
        body: Container(
            child: Column(
              
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(child: 
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(30),
              child: Text('$texttodisplay',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,

             ))),),
            
            Row(
              children: <Widget>[
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),
          ],
        )));
  }
}
