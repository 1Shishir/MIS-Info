import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GirdViewItem extends StatelessWidget {
  final String title;
  final String img;
  final Color color;
  const GirdViewItem({super.key, required this.title, required this.img, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: const [
           BoxShadow(
      blurRadius: 10, 
      spreadRadius: 2, 
      offset: Offset(0, 4),
      color: Colors.black26, 
    ),
        ],
      ),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(img,height: 80,width: 80,),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
          ),
        ],
      ),
    );
  }
}
