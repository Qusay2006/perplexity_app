import 'package:flutter/material.dart';
import 'package:perplexity_app/core/theme/pallet.dart';

class SearchBarButton extends StatefulWidget {
  final IconData iconData;
  final String text;
  const SearchBarButton({super.key, required this.iconData, required this.text});

  @override
  State<SearchBarButton> createState() => _SearchBarButtonState();
}
class _SearchBarButtonState extends State<SearchBarButton> {
  bool isHovered=false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit:(event) {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isHovered ?  Pallet.iconGrey:Colors.transparent,   ),
        child: Row(children: [
          Icon(widget.iconData,
            size:20,
          color: Pallet.iconGrey,),
          SizedBox(width: 5,),
          Text(widget.text,style: TextStyle(color: Pallet.textGrey),)
        ],)

      ),
    );
  }
}
