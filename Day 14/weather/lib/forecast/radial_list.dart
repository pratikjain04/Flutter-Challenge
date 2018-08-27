import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather/generic_widget/radial_position.dart';


class RadialList extends StatelessWidget {

  final RadialListViewModel radialList;

  RadialList({
    this.radialList
});

  List<Widget> _radialListItems(){
    final double firstItemAngle = -pi/3;
    final double lastItemAngle = pi/3;
    final double angleDiffPerItem = (lastItemAngle - firstItemAngle) / (radialList.items.length-1);

    double currAngle = firstItemAngle;

    return radialList.items.map((RadialListItemViewModel viewModel){
      final listItem = _radialListItem(viewModel, currAngle);
      currAngle += angleDiffPerItem;
      return listItem;
    }).toList();
  }

  Widget _radialListItem(RadialListItemViewModel viewModel, double angle){

    return Transform(
      transform: Matrix4.translationValues(
          40.0,
          334.0,    //this was found experimentally, IN PRODUCTION ENVIRONMENT USE SIZE OF THE SCREEN AS VARIABLE
          0.0
      ),
      child: RadialPosition(        //Radial Position is a custom Widget
        radius: 144.0 + 75.0,       //to push it to the right side of the screen
        angle: angle,
        child: RadialListItem(
          listItem: viewModel,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      //we will stack a bunch of list items on top of each other
      children: _radialListItems(),

    );
  }
}


class RadialListItem extends StatelessWidget {

  final RadialListItemViewModel listItem;

  RadialListItem({
   this.listItem
});

  @override
  Widget build(BuildContext context) {

    final circleDecoration = listItem.isSelected
    ? BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,

    )
    : BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(
            color: Colors.white,
            width: 2.0
        )
    );


    return Transform(
      //currently the origin is the top left but we don't need that
      //we need the origin at the center of the circle
      transform: Matrix4.translationValues(-30.0, -30.0, 0.0),
      child: Row(
        children: <Widget>[
          //we need a circular icon
          Container(
              width: 60.0,
              height: 60.0,
            //this will make the container circular
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: Colors.white,
                width: 2.0
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(7.0),
              //the center of the circle has an image
              child: Image(
                  image: listItem.icon,
                color: listItem.isSelected ? Color(0xFF6688CC): Colors.white,   //if selected then blue color
              )
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,   //shrinks the size
              children: <Widget>[
                Text(
                  listItem.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0
                  ),
                ),
                Text(
                  listItem.subtitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//this is the model of the RadialListView
class RadialListViewModel{

  List<RadialListItemViewModel> items;
  RadialListViewModel({
    this.items = const[]
  });

}

//The content of the Items are inside this class
class RadialListItemViewModel{

  final ImageProvider icon;
  final String title;
  final String subtitle;
  final bool isSelected;

  RadialListItemViewModel({
    this.icon,
    this.title = '',
    this.subtitle = '',
    this.isSelected = false,
  });
}