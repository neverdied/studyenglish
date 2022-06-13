import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
  }
  class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context){
      return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Page(),
            ),
          ),
        ),
      );
    }
}

class Page extends StatefulWidget{
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page>{

  List<Icon> scoreKeeper=[
  ];

  List<String> questions=[
    '你能改变世界',
    '世界能改变你',
    '你很平凡'
  ];

  List<bool> answer=[
    false,
    true,
    true
  ];



  int questionNumber=0;

  addIcon(bool flag){
    if(flag==true){
      return scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    }else{
      scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex:5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber],
                textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white
                  ),
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: (){
                  setState(() {
                    if(answer[questionNumber]==true){
                      addIcon(true);
                    }else{
                      addIcon(false);
                    }
                    questionNumber+=1;

                  });

                },
              ),
        ),
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: (){
                  setState(() {
                    if(answer[questionNumber]==false){
                      addIcon(true);
                    }else{
                      addIcon(false);
                    }
                    questionNumber++;

                  });
                  },
              ),
        ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
