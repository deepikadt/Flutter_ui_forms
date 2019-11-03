import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget
{
  final Function changeImageState;
  final String options;

  CustomButton(this.changeImageState,this.options);

  @override
  Widget build(BuildContext context) {
    return Container
    (
      width: double.infinity,
      child: RaisedButton
      (
        child:Text(options),
        onPressed: changeImageState,
      ),
    );
  }

}


