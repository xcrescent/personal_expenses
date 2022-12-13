import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal_expenses/widgets/Category.dart';
import 'package:personal_expenses/widgets/add_transaction.dart';
import 'package:personal_expenses/widgets/bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late PersistentBottomSheetController _controller;
  bool bottomText1 = true,
      bottomText2 = false,
      bottomText3 = false,
      bottomText4 = false;
  Map<int, bool> selected = {0: true, 1: false, 2: false, 3: false};
  changeBottomtab(int x) {
    setState(() {
      for (int i = 0; i < 4; i++) {
        if (x == i) {
          selected[i] = true;
        } else {
          selected[i] = false;
        }
      }
    });
  }

  

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // quickNote.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0,
      ),
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(color: Colors.white60),
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
                    const Text(
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
                        theme: const SvgTheme(
                            currentColor: Color(0xff000000),
                            fontSize: 14.0,
                            xHeight: 7.0),
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
                                    horizontal: 8.0,
                                    vertical: 14.0,
                                  ),
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
                                  width: 147,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              height: 24,
                                              width: 24,
                                              padding:
                                                  const EdgeInsets.all(4.0),
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
                                              color: Color(0xff525251),
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
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 14.0,
                                  ),
                                  height: 87,
                                  width: 147,
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
                                            padding: const EdgeInsets.all(4.0),
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
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          const Text(
                                            "Highest Spent",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              color: Color(0xff525251),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  ),
                                  GestureDetector(
                                    onTap: () => showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) => addTransaction(
                                          context,
                                         
                                        )
                                    ),
                                    child: Container(
                                      width: 78,
                                      height: 80,
                                      margin: EdgeInsets.fromLTRB(36, 0, 0, 0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF303F9F),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Add",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RichText(
                    text: const TextSpan(
                      text: "Categories",
                      style: TextStyle(
                        color: Color(0xff525251),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      CategoryWidget(
                        title: "Food",
                        svgPath: "assets/images/category/food.svg",
                        color: Color(0xffEB6842),
                      ),
                      CategoryWidget(
                        title: "Pet",
                        svgPath: "assets/images/category/pet.svg",
                        color: Color(0xffE91E63),
                      ),
                      CategoryWidget(
                        title: "Shopping",
                        svgPath: "assets/images/category/shopping.svg",
                        color: Color(0xff8D62F7),
                      ),
                      CategoryWidget(
                        title: "Entertainment",
                        svgPath: "assets/images/category/entertainment.svg",
                        color: Color(0xff77ADD9),
                      ),
                      CategoryWidget(
                        title: "Personal Care",
                        svgPath: "assets/images/category/personal_care.svg",
                        color: Color(0xff66BB6A),
                      ),
                      CategoryWidget(
                        title: "Travel",
                        svgPath: "assets/images/category/travel.svg",
                        color: Color(0xffF44336),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 36.0),
                  child: RichText(
                    text: const TextSpan(
                      text: "Task",
                      style: TextStyle(
                        color: Color(0xff525251),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2000,
                ),
              ],
            ),
          ),
        ),
      ),
      // backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            // margin: const EdgeInsets.all(16),
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, //New
                    blurRadius: 25.0,
                    offset: Offset(-10, 10),
                    spreadRadius: 20),
                BoxShadow(
                    color: Colors.grey, //New
                    blurRadius: 25.0,
                    offset: Offset(-10, -10),
                    spreadRadius: 20)
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavTab(
                    val: 0,
                    icon: Icons.home_rounded,
                    text: "Home",
                    selected: selected[0],
                    callback: changeBottomtab),
                BottomNavTab(
                    val: 1,
                    icon: Icons.credit_card_outlined,
                    text: "Credit",
                    selected: selected[1],
                    callback: changeBottomtab),
                BottomNavTab(
                    val: 2,
                    icon: Icons.pie_chart_outline,
                    text: "Analysis",
                    selected: selected[2],
                    callback: changeBottomtab),
                // SizedBox(
                //   child: RichText(
                //     text: TextSpan(
                //       children: [
                //         const WidgetSpan(
                //           child: Icon(
                //             Icons.credit_card_outlined,
                //             color: Color(0xFFB7B7B7),
                //             size: 18,
                //           ),
                //         ),
                //         !bottomText
                //             ? const TextSpan(
                //                 text: "Credit",
                //                 style: TextStyle(
                //                   color: Color(0xFFB7B7B7),
                //                 ),
                //               )
                //             : const TextSpan(
                //                 text: "",
                //               ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   child: RichText(
                //     text: TextSpan(
                //       children: [
                //         const WidgetSpan(
                //           child: Icon(
                //             Icons.pie_chart_outline,
                //             color: Color(0xFFB7B7B7),
                //             size: 18,
                //           ),
                //         ),
                //         !bottomText
                //             ? const TextSpan(
                //                 text: "Analysis",
                //               )
                //             : const TextSpan(
                //                 text: "",
                //               ),
                //       ],
                //     ),
                //   ),
                // ),
                Container(
                  width: 68,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor:
                          selected[3]! ? Color(0xffE8EAF6) : Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                    ),
                    onPressed: (() {
                      changeBottomtab(3);
                    }),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              child: SvgPicture.asset(
                                "assets/images/Vectoraward.svg",
                                color: const Color(0xFFB7B7B7),
                              ),
                            ),
                          ),
                          !selected[3]!
                              ? const TextSpan(
                                  text: "Award",
                                )
                              : const TextSpan(
                                  text: "",
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                // const BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.credit_card_outlined,
                //     color: Color(0xFFB7B7B7),
                //   ),
                //   label: "Credit",
                // ),
                // const BottomNavigationBarItem(
                //     icon: Icon(
                //       Icons.pie_chart_outline,
                //       color: Color(0xFFB7B7B7),
                //     ),
                //     label: "Analysis"),
                // BottomNavigationBarItem(
                //     icon: SvgPicture.asset("assets/images/Vectoraward.svg",
                //         color: Color(0xFFB7B7B7)),
                //     label: "Award"),
              ],
            ),
          ),
        ),
      ),
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
