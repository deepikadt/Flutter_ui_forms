import 'package:flutter/material.dart';

class Recommandations extends StatefulWidget {
  @override
  _RecommandationsState createState() => _RecommandationsState();
}

class _RecommandationsState extends State<Recommandations> {
  int _current=0;

  var userSurvey = [
    {
      'ques': 'What\'s your age?',
      'ans': ['15 to 18', '18 to 30', '30 to 40', 'above 40']
    },
    {
      'ques': 'What\'s gender',
      'ans': ['male', 'female', 'other']
    },
    {
      'ques': 'What\'s your size',
      'ans': ['xs', 's', 'l', 'xl']
    },
  ];

  void setQues() {
    setState(() {
      print(_current);
      
      _current<2?_current=_current += 1:_current=0;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommadations'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: <Widget>[


                Text(userSurvey[_current]['ques']),

                ...(userSurvey[_current]['ans'] as List<String>).map((answer)
                {
                  return RaisedButton(child:Text(answer),onPressed: (){
                    setQues();
                  },);
                }),

              ],
            ),
          ),
        ),
     
    );
  }
}
