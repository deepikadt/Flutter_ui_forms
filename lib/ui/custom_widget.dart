import "package:flutter/material.dart";

//custom widget called in login page
class CarouselSlider extends StatelessWidget
{
  final String image;

  CarouselSlider(this.image);

  @override
  Widget build(BuildContext context){
    return Card(
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        height: 350,
        width: 250,
      ),
    
    );
  }

}
