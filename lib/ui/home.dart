import 'package:flutter/material.dart';
import './image_quiz.dart';
import './image_quiz_complete.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> 
{
   int _current = 0;
  int _totalScore=0;


  final _images = [
    {
      'image': 'assets/img.jpg',
      'comment': [
        {'review': 'excellent', "score": 40},
        {'review':'good','score': 30},
        {'review':'average','score': 20},
        {'review':'Not good','score': 10}
      ],
    },
    {
      'image': 'assets/img1.jpg',
      'comment': [
        {'review':'not good','score': 10},
        {'review':'average','score': 20},
        {'review':'good','score': 30},
        {'review': 'excellent', "score": 40},
      ],
    },
    {
      'image': 'assets/img.jpg',
      'comment': [
      {'review': 'excellent', "score": 40},
        {'review':'good','score': 30},
        {'review':'average','score': 20},
        {'review':'Not good','score': 10}
      ],
    },
    {
      'image': 'assets/img1.jpg',
      'comment': [
        {'review':'not good','score': 10},
        {'review':'average','score': 20},
        {'review':'good','score': 30},
        {'review': 'excellent', "score": 40},
      ],
    },

  ];

  void _changeImage(int score) {
    print(score);
     print(_totalScore);
    setState(() {
      _current = _current + 1;
      _totalScore +=  score;

      //  _current < images.length-1?_current = _current + 1 :_current=0;
      //_current < images.length-1?_totalScore += _totalScore + 1 : _totalScore=0 ;
    });
   
  }

  void _resetQuiz(){
    setState(() {
      _current=0;
      _totalScore=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 70),
          child: _current < _images.length
              ? QuizStarted(_images, _current, _changeImage)
              : QuizCompleted(_totalScore,_resetQuiz),
        ),
      ),
    );
  }

  //  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: SingleChildScrollView(
  //         padding: const EdgeInsets.only(top: 70),
  //         child: Column(
  //                 children: <Widget>[
  //                   CarouselSlider(images[_current]['image']),

  //                   ...(images[_current]['comment'] as List<String>)
  //                       .map((question) {
  //                     return CustomButton(_changeImage, question);
  //                   }).toList(),

  //                 ],
  //               ),

  //       ),
  //     ),
  //   );
  // }
}
