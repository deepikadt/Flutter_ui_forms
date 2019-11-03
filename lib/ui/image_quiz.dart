import 'package:flutter/material.dart';
import './custom_widget.dart';
import './button_custom_widget.dart';

class QuizStarted extends StatelessWidget {
  final List<Map<String, Object>> imageMap;
  final int _current;
  final Function _changeImage;

  QuizStarted( this.imageMap ,this._current , this._changeImage);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        CarouselSlider(imageMap[_current]['image']),
        
        ...(imageMap[_current]['comment'] as List<Map<String,Object>>).map((question) 
        {
          return CustomButton(()=>_changeImage(question['score']), question['review']);
        }).toList(),

      ],
    );
  }
}
