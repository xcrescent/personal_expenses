import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 20, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: 'You doing\n great keep it up.',
                          style: TextStyle(
                            color: Color(0xff525251),
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                    ),
                    Text(
                      "🫰",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 27,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 527,
                  // width: 328,
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  // padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Color(0xff303F9F),
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 24),
                        child: Column(
                          children: [
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Total Spends',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              "₹12,000",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            const Text(
                              "₹18,000",
                              style: TextStyle(
                                color: Color(0xffADB4E2),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            const Text(
                              " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",
                              style: TextStyle(
                                color: Color(0xffADB4E2),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                            const Text(
                              "budget",
                              style: TextStyle(
                                color: Color(0xffADB4E2),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/images/Vector 324.svg',
                        // color: LinearGradient(colors: ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Center(
                        child: Text(
                          "Jan month’s data",
                          style: TextStyle(
                            color: Color(0xff8D96D6),
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        // alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // boxShadow: const [
                          //   BoxShadow(
                          //     offset: Offset(0.5, 0),
                          //     blurRadius: 30,
                          //     spreadRadius: 1,
                          //     color: Color(0xff303F9F),
                          //   )
                          // ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 14.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                    // boxShadow: const [
                                    //    BoxShadow(
                                    //     offset: Offset(0.5, 0),
                                    //     blurRadius: 30,
                                    //     spreadRadius: 1,
                                    //     color: Colors.white,
                                    //   )
                                    // ],
                                  ),
                                  height: 87,
                                  // width: 144,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              height: 24,
                                              width: 24,
                                              decoration: BoxDecoration(
                                                color: Color(0xffE19500)
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(32)),
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/images/projected_saving.svg',
                                                height: 16,
                                                width: 16,
                                                color: Color(0xffE19500),
                                              )),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          const Text(
                                            "Projected Saving",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      const Text(
                                        "₹2,000",
                                        style: TextStyle(
                                          color: Color(0xff2F2F30),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 9,
                                ),
                                Container(
                                  height: 87,
                                  // width: 144,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 24,
                                            width: 24,
                                            decoration: BoxDecoration(
                                              color: Color(0xffEB6842)
                                                  .withOpacity(0.25),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(32)),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/images/highest_spent.svg',
                                              height: 16,
                                              width: 16,
                                              color: Color(0xffEB6842),
                                            ),
                                          ),
                                          const Text(
                                            "Highest Spent",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        "₹2,000",
                                        style: TextStyle(
                                          color: Color(0xff2F2F30),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 183,
                              // width: 144,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Card Balance",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      color: Color(0xff525251),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "₹1,500",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 4),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 1, horizontal: 5),
                                        decoration: BoxDecoration(
                                          color: Color(0xffE13B30)
                                              .withOpacity(0.26),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(32)),
                                        ),
                                        child: const Text(
                                          "Low bal",
                                          style: TextStyle(
                                            color: Color(0xffE13B30),
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 9, dashSpace = 5, startX = 0;
    final paint = Paint();
    paint.color = Colors.grey; //color
    paint.strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
