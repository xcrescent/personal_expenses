import 'package:flutter/material.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < 3; i++)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              width: 304,
              height: 345,
              decoration: BoxDecoration(
                // border: Border.all(color: const Color(0xFFEEEEEE)),
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 2),
                    color: Color(0xffEEEEEE),
                    blurStyle: BlurStyle.outer,
                    blurRadius: 10,
                    // spreadRadius: -2,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 180,
                    width: 304,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "A rewarding celebration",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xff0C0C0C),
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Win rewards from Citizen, peter\nengland,and More",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            fontSize: 14,
                            color: Color(0xff0C0C0C),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            minimumSize: const Size(double.infinity, 40),
                            backgroundColor: const Color(0xffFFFFFF),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Color(0xFFADB4E2),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Explore rewards  +",
                            style: TextStyle(
                              color: Color(0xFF303F9F),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          // const SizedBox(
          //   width: 16,
          // ),
        ],
      ),
    );
  }
}
