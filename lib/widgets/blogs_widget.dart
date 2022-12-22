import 'package:flutter/material.dart';

class BlogsWidget extends StatelessWidget {
  const BlogsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < 3; i++)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              height: 310,
              width: 312,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Color(0xFFEEEEEE)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 135,
                    width: 280,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 4, right: 16, bottom: 4),
                    child: Text(
                      "4 methods of calculating Network,Which no one will tell you",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      "Read Time: 8 mins",
                      style: TextStyle(
                        color: Color(0xFF303F9F),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                    width: 264,
                    height: 24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 24,
                          width: 24,
                          child: CircleAvatar(
                            // radius: 24,
                            backgroundImage: AssetImage(
                              'assets/images/blogs/user.png',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.031,
                        ),
                        const Text(
                          "Ann Korkowski",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xff525251),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.13,
                        ),
                        const Text(
                          "08/09/2022",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xff525251),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
