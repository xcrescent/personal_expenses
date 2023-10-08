import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaskWidget  extends StatelessWidget{
  const TaskWidget({super.key, required this.kycdone, required this.title, required this.svgPath, required this.color, required this.text});
  final bool kycdone;
  final String title;
  final String svgPath;
   final Color color;
   final String text;
  @override
  Widget build(BuildContext context) {
    return 
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            width: 156*MediaQuery.of(context).size.width/375,
            height: 152*MediaQuery.of(context).size.height/750,
            decoration: BoxDecoration(
              border: Border.all(width: 0.1, color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 82,
                      height: 73,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28),
                          bottomRight: Radius.elliptical(80, 80),
                          bottomLeft: Radius.elliptical(50, 32),
                          topRight: Radius.elliptical(23, 50),
                        ),
                      ),
                      child:
                          // SvgPicture.asset(
                          //   "assets/images/task/key.svg",
                          //   color: ,
                          // ),

                          Image.asset(
                        svgPath,
                        height: 40,
                        width: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    kycdone ? SvgPicture.asset('assets/images/task/tick.svg', color: Color(0xff34C759),) : Text(
                      title,
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: Color(0xff0C0C0C),
                        ),
                      ),
                      Text(
                        'Create Category and',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          color: Color(0xff525251),
                        ),
                      ),
                      Text(
                        'earn ₹25',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          color: Color(0xff525251),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );



  }}

        
//           const SizedBox(
//             width: 8,
//           ),
//           Container(
//             width: 156,
//             height: 152,
//             decoration: BoxDecoration(
//               border: Border.all(width: 0.1, color: Colors.grey),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       width: 82,
//                       height: 73,
//                       padding: const EdgeInsets.all(20),
//                       decoration: const BoxDecoration(
//                         color: Color(0xffD6F4DE),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(28),
//                           bottomRight: Radius.elliptical(80, 80),
//                           bottomLeft: Radius.elliptical(50, 32),
//                           topRight: Radius.elliptical(23, 50),
//                         ),
//                       ),
//                       child:
//                           // SvgPicture.asset(
//                           //   "assets/images/task/key.svg",
//                           //   color: ,
//                           // ),

//                           Image.asset(
//                         'assets/images/task/burger.png',
//                         height: 40,
//                         width: 40,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     const Text(
//                       '02',
//                       style: TextStyle(
//                         fontSize: 40,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xffD6F4DE),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Text(
//                         'Create Category',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Poppins',
//                           color: Color(0xff0C0C0C),
//                         ),
//                       ),
//                       Text(
//                         'Create Category and',
//                         style: TextStyle(
//                           fontSize: 10,
//                           fontWeight: FontWeight.w400,
//                           fontFamily: 'Poppins',
//                           color: Color(0xff525251),
//                         ),
//                       ),
//                       Text(
//                         'earn ₹25',
//                         style: TextStyle(
//                           fontSize: 10,
//                           fontWeight: FontWeight.w400,
//                           fontFamily: 'Poppins',
//                           color: Color(0xff525251),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             width: 8,
//           ),
//           Container(
//             width: 156,
//             height: 152,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 width: 0.1,
//                 color: Colors.grey,
//               ),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Column(
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       width: 82,
//                       height: 73,
//                       padding: const EdgeInsets.all(20),
//                       decoration: const BoxDecoration(
//                         color: Color(0xffFBEBCE),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(28),
//                           bottomRight: Radius.elliptical(80, 80),
//                           bottomLeft: Radius.elliptical(50, 32),
//                           topRight: Radius.elliptical(23, 50),
//                         ),
//                       ),
//                       child:
//                           // SvgPicture.asset(
//                           //   "assets/images/task/key.svg",
//                           //   color: ,
//                           // ),

//                           Image.asset(
//                         'assets/images/task/moneymoji.png',
//                         height: 40,
//                         width: 40,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     const Text(
//                       '03',
//                       style: TextStyle(
//                         fontSize: 40,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xffFBEBCE),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Text(
//                         'Set Limit to categ..',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Poppins',
//                           color: Color(0xff0C0C0C),
//                         ),
//                       ),
//                       Text(
//                         'Create Category and',
//                         style: TextStyle(
//                           fontSize: 10,
//                           fontWeight: FontWeight.w400,
//                           fontFamily: 'Poppins',
//                           color: Color(0xff525251),
//                         ),
//                       ),
//                       Text(
//                         'earn ₹25',
//                         style: TextStyle(
//                           fontSize: 10,
//                           fontWeight: FontWeight.w400,
//                           fontFamily: 'Poppins',
//                           color: Color(0xff525251),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             width: 8,
//           ),
//           Container(
//             width: 156,
//             height: 152,
//             decoration: BoxDecoration(
//               border: Border.all(width: 0.1, color: Colors.grey),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       width: 82,
//                       height: 73,
//                       padding: const EdgeInsets.all(20),
//                       decoration: const BoxDecoration(
//                         color: Color(0xffD3D6F1),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(28),
//                           bottomRight: Radius.elliptical(80, 80),
//                           bottomLeft: Radius.elliptical(50, 32),
//                           topRight: Radius.elliptical(23, 50),
//                         ),
//                       ),
//                       child:
//                           // SvgPicture.asset(
//                           //   "assets/images/task/key.svg",
//                           //   color: ,
//                           // ),

//                           Image.asset(
//                         'assets/images/task/lap_man.png',
//                         height: 40,
//                         width: 40,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     const Text(
//                       '04',
//                       style: TextStyle(
//                         fontSize: 40,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xffD3D6F1),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Text(
//                         'Add apps to categ..',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Poppins',
//                           color: Color(0xff0C0C0C),
//                         ),
//                       ),
//                       Text(
//                         'Create Category and',
//                         style: TextStyle(
//                           fontSize: 10,
//                           fontWeight: FontWeight.w400,
//                           fontFamily: 'Poppins',
//                           color: Color(0xff525251),
//                         ),
//                       ),
//                       Text(
//                         'earn ₹25',
//                         style: TextStyle(
//                           fontSize: 10,
//                           fontWeight: FontWeight.w400,
//                           fontFamily: 'Poppins',
//                           color: Color(0xff525251),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             width: 8,
//           ),
//           Container(
//             width: 156,
//             height: 152,
//             decoration: BoxDecoration(
//               border: Border.all(width: 0.1, color: Colors.grey),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Positioned(
//                       child: Container(
//                         width: 82,
//                         height: 73,
//                         padding: const EdgeInsets.all(20),
//                         decoration: const BoxDecoration(
//                           color: Color(0xffF7F0DC),
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(28),
//                             bottomRight: Radius.elliptical(80, 80),
//                             bottomLeft: Radius.elliptical(50, 32),
//                             topRight: Radius.elliptical(23, 50),
//                           ),
//                         ),
//                         child:
//                             // SvgPicture.asset(
//                             //   "assets/images/task/key.svg",
//                             //   color: ,
//                             // ),

//                             Image.asset(
//                           'assets/images/task/cash_bag.png',
//                           height: 40,
//                           width: 40,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     const Text(
//                       '05',
//                       style: TextStyle(
//                         fontSize: 40,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xffF7F0DC),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Text(
//                         'Make on taxn',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Poppins',
//                           color: Color(0xff0C0C0C),
//                         ),
//                       ),
//                       Text(
//                         'Create Category and',
//                         style: TextStyle(
//                           fontSize: 10,
//                           fontWeight: FontWeight.w400,
//                           fontFamily: 'Poppins',
//                           color: Color(0xff525251),
//                         ),
//                       ),
//                       Text(
//                         'earn ₹25',
//                         style: TextStyle(
//                           fontSize: 10,
//                           fontWeight: FontWeight.w400,
//                           fontFamily: 'Poppins',
//                           color: Color(0xff525251),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             width: 8,
//           ),
//           Container(
//             width: 156,
//             height: 152,
//             decoration: BoxDecoration(
//               border: Border.all(width: 0.1, color: Colors.grey),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       width: 82,
//                       height: 73,
//                       padding: const EdgeInsets.all(20),
//                       decoration: const BoxDecoration(
//                         color: Color(0xffEEECE2),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(28),
//                           bottomRight: Radius.elliptical(80, 80),
//                           bottomLeft: Radius.elliptical(50, 32),
//                           topRight: Radius.elliptical(23, 50),
//                         ),
//                       ),
//                       child:
//                           // SvgPicture.asset(
//                           //   "assets/images/task/key.svg",
//                           //   color: ,
//                           // ),

//                           Image.asset(
//                         'assets/images/task/cash.png',
//                         height: 40,
//                         width: 40,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     const Text(
//                       '06',
//                       style: TextStyle(
//                         fontSize: 40,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xffEEECE2),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 6, right: 6, top: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Text(
//                         'Make 5 taxn in each category',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 14,
//                           height: 1,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Poppins',
//                           color: Color(0xff0C0C0C),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10),
//                         child: Text(
//                           'Create Category and earn ₹25',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 10,
//                             fontWeight: FontWeight.w400,
//                             fontFamily: 'Poppins',
//                             color: Color(0xff525251),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
