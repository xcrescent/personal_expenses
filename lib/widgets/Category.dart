import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {super.key,
      required this.title,
      required this.svgPath,
      required this.color});
  final String title;
  final String svgPath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 64,
                height: 64,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFEEEEEE),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: SvgPicture.asset(
                    svgPath,
                    color: color,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF525251),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
