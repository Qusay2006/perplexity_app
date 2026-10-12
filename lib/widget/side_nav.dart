import 'package:flutter/material.dart';
import 'package:perplexity_app/core/theme/pallet.dart';

class SideNav extends StatefulWidget {
  const SideNav({super.key});

  @override
  State<SideNav> createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
   bool isCollapsed=false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 90),
      width: isCollapsed? 150:69,
    color: Pallet.sideNav,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(crossAxisAlignment: isCollapsed?CrossAxisAlignment.start:CrossAxisAlignment.center,
        children: [
       TextButton(onPressed: () {

       }, child: Icon(Icons.auto_awesome_mosaic,size: 30,color: Pallet.whiteColor,)),


       const SizedBox(height: 40,),
        TextButton(onPressed: () {

        }, child: Row(mainAxisAlignment: isCollapsed?MainAxisAlignment.start:MainAxisAlignment.center,
          children: [
            Icon(Icons.add,size: 24,color: Pallet.iconGrey,),
            SizedBox(width: 13,),
            isCollapsed?Text('Add',style: TextStyle(
                fontWeight:FontWeight.bold,
            fontSize: 16),):SizedBox(),

          ],
        )),
        const SizedBox(height: 13,),

          TextButton(onPressed: () {

          }, child: Row(mainAxisAlignment: isCollapsed?MainAxisAlignment.start:MainAxisAlignment.center,
            children: [
              Icon(Icons.search,size: 24,color: Pallet.whiteColor,),
              SizedBox(width: 13,),
              isCollapsed?Text('Search',style: TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize: 17)
                ,):SizedBox(),
            ],
          )),

          const SizedBox(height: 13,),  TextButton(onPressed: () {

          }, child: Row(mainAxisAlignment: isCollapsed?MainAxisAlignment.start:MainAxisAlignment.center,
            children: [

              Icon(Icons.auto_awesome,size: 24,color: Pallet.whiteColor,),
              SizedBox(width: 13,),
              isCollapsed?Text('Discover',style: TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize: 17)
                ,):SizedBox(),
            ],
          )),


          const SizedBox(height: 13,),

          TextButton(onPressed: () {

          }, child: Row(mainAxisAlignment: isCollapsed?MainAxisAlignment.start:MainAxisAlignment.center,
            children: [
              Icon(Icons.language,size: 24,color: Pallet.whiteColor,),
              SizedBox(width: 13,),
              isCollapsed?Text('Spaces',style: TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize: 17)
                ,):SizedBox(),
            ],
          )),

          const SizedBox(height: 13,),

          TextButton(onPressed: () {

        }, child: Row(mainAxisAlignment: isCollapsed?MainAxisAlignment.start:MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud_outlined,size: 24,color: Pallet.whiteColor,),
            SizedBox(width: 13,),
            isCollapsed?Text('Library',style: TextStyle(
                fontWeight:FontWeight.bold,
                fontSize: 17)
              ,):SizedBox(),
          ],
        )),


        const Spacer(),
        TextButton(onPressed: () {
          setState(() {
            isCollapsed =!isCollapsed;
          });
        }, child: Icon(isCollapsed?Icons.arrow_left_outlined:Icons.arrow_right_outlined
          ,size: 30,color: Pallet.whiteColor,))
        ,

      ],),
    ),);
  }
}
