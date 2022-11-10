
import 'package:flutter/material.dart';

class ItemCategoryWidget extends StatelessWidget {

  int colorr;
  String txt;
  Icon icono;

  ItemCategoryWidget({
    required this.colorr,
    required this.txt,
    required this. icono,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 14.0, vertical: 14.0,
      ),
      margin: EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        color: Color(colorr),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Icon(
            Icons.ac_unit_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 6.0,
          ),
          Text(
            txt,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.0
            ),
          ),
        ],
      ),
    );
  }
}
