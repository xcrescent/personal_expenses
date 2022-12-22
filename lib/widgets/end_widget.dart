import 'package:flutter/material.dart';

class EndWidegt extends StatelessWidget {
  const EndWidegt({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      width: 328,
      height: 220,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 5,
            height: 220,
            color: const Color(0xFFD9D9D9),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 313,
            height: 192,
            child: const Text(
              "A budget doesn’t limit your freedom;\nit gives you freedom",
              style: TextStyle(
                fontSize: 32,
                color: Color(0xFFC9C9C9),
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          )
        ],
      ),
    );
  }
}
