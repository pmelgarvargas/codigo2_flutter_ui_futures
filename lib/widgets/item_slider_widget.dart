import 'package:flutter/material.dart';

class ItemSliderWidget extends StatelessWidget {
  Function onMandarina;
  Map<String, dynamic> place;

  ItemSliderWidget({
    required this.onMandarina,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      splashColor: Colors.black12,
      onTap: () {
        onMandarina();
      },
      child: Container(
        height: 140,
        width: 210,
        margin: const EdgeInsets.only(right: 12.0, bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
                color: Color(0xff34383F).withOpacity(0.12),
                blurRadius: 12,
                offset: const Offset(0, 4)),
          ],
          image: DecorationImage(
            image: NetworkImage(
              place["image"],
            ),
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    const Color(0xff34383F).withOpacity(0.4),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place["place"],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "${place["rate"]} (${place["reviews"]} views)",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
