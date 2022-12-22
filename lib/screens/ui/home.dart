import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:personal_expenses/controllers/db.dart';
import 'package:personal_expenses/controllers/model.dart';
import 'package:personal_expenses/screens/auth/login_screen.dart';
import 'package:personal_expenses/screens/auth/signup_screen.dart';
import 'package:personal_expenses/widgets/Category.dart';
import 'package:personal_expenses/widgets/add_transaction.dart';
import 'package:personal_expenses/widgets/blogs_widget.dart';
import 'package:personal_expenses/widgets/bottom_nav.dart';
import 'package:personal_expenses/widgets/end_widget.dart';
import 'package:personal_expenses/widgets/offer_widger.dart';
import 'package:personal_expenses/widgets/task_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.name, required this.res});
  final String name;
  final Map res;
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loggedIn = true;
  bool boolKYC = false;
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

  getAllSavedData() async {
    List<BoolCom> x = await handler.retrieveComUser();
    if (x.isNotEmpty) {
      if (x[0].boole == 1) {
        boolKYC = true;
      }
    }
    //  else {
    // await handler.insertCom();
    // }
    setState(() {});
  }

  late DataBaseCon handler;
  Future<int> addUser() async {
    User user = User(
        id: 1,
        accessToken: widget.res['accessToken'],
        refreshToken: widget.res['refreshToken']);

    return await handler.insertUser(user);
  }

  @override
  void initState() {
    super.initState();
    handler = DataBaseCon();
    handler.initializedComDB();
    handler.initializedDB().whenComplete(() async {
      int m = await addUser();
      setState(() {});
    });
    getAllSavedData();
  }

  @override
  void dispose() {
    // quickNote.dispose();
    super.dispose();
  }

  // completeKYC() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setBool("complete", true);
  //   setState(() {
  //     boolKYC = true;
  //   });
  // }

  logout() async {
    await DataBaseCon().deleteUser(1).then((value) => Navigator.of(context)
        .pushReplacement(
            MaterialPageRoute(builder: (context) => const SignUpActivity())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.width * 0.2),
        child: ClipRRect(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 3,
              leading: Image.asset("assets/images/appbar.png"),
              actions: [
                PopupMenuButton(
                  icon: SvgPicture.asset(
                    "assets/images/Options.svg",
                    height: 22,
                    width: 22,
                  ),
                  onSelected: (value) {
                    logout();
                  },
                  iconSize: 28,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      height: 20,
                      value: 1,
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          // color: Colors.white,

                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome back,",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF525251),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF2F2F30),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              top: MediaQuery.of(context).size.width * 0.27,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'You doing\ngreat keep it up.',
                      style: TextStyle(
                        color: Color(0xff525251),
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset('assets/images/half_heart.png')
                  ],
                ),
                Container(
                  height: boolKYC ? 527 : 497,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '₹',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily:
                                          GoogleFonts.roboto().fontFamily,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: boolKYC ? "12,000" : "0",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: const [
                            Text(
                              "₹18,000",
                              style: TextStyle(
                                color: Color(0xffADB4E2),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              " - - - - - - - - - - - - - - - - - - - - - - - - ",
                              style: TextStyle(
                                color: Color(0xffADB4E2),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            Text(
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
                      boolKYC
                          ? SvgPicture.asset(
                              'assets/images/Vector 324.svg',
                              theme: const SvgTheme(
                                currentColor: Color(0xff000000),
                                fontSize: 14.0,
                                xHeight: 7.0,
                              ),
                              // color: LinearGradient(colors: ),
                            )
                          : Container(
                              width: 24,
                              height: 4,
                              margin: const EdgeInsets.only(top: 120),
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                            ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Center(
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
                      boolKYC
                          ? Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffE19500)
                                                          .withOpacity(0.2),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  32)),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
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
                                                    color: Color(0xffEB6842)
                                                        .withOpacity(0.25),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                32)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 4),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 1,
                                                      horizontal: 5),
                                              decoration: BoxDecoration(
                                                color: Color(0xffE13B30)
                                                    .withOpacity(0.26),
                                                borderRadius:
                                                    const BorderRadius.all(
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
                                              builder: (context) =>
                                                  addTransaction(
                                                    context,
                                                  )),
                                          child: Container(
                                            width: 78,
                                            height: 80,
                                            margin: const EdgeInsets.fromLTRB(
                                              48,
                                              16,
                                              0,
                                              0,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 30, horizontal: 17),
                                            decoration: const BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurStyle: BlurStyle.outer,
                                                  blurRadius: 10,
                                                )
                                              ],
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.elliptical(39, 40),
                                                  topRight:
                                                      Radius.elliptical(39, 40),
                                                  bottomLeft:
                                                      Radius.elliptical(39, 40),
                                                  bottomRight:
                                                      Radius.elliptical(
                                                          39, 40)),
                                              color: Color(0xFF303F9F),
                                            ),
                                            child: const Text(
                                              '  Add   ',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                    width: 188,
                                    height: 128,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 8),
                                          width: 188,
                                          height: 72,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                "Pending KYC",
                                                style: TextStyle(
                                                  color: Color(0xff0C0C0C),
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                              Text(
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xFFE13B30),
                                              fixedSize: const Size(148, 39),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              )),
                                          onPressed: () async {
                                            setState(() {
                                              boolKYC = true;
                                            });

                                            await handler.insertCom();
                                          },
                                          child: Text(
                                            "Complete Now",
                                            style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 116,
                                    width: 105,
                                    decoration: const BoxDecoration(
                                      color: Color(0x1AE13B30),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.elliptical(40, 110),
                                        topRight: Radius.elliptical(16, 16),
                                        bottomLeft: Radius.elliptical(250, 250),
                                        bottomRight: Radius.elliptical(96, 35),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 41.0,
                                          bottom: 44,
                                          right: 16,
                                          top: 24),
                                      child: Image.asset(
                                        'assets/images/key.png',
                                        width: 48,
                                        height: 48,
                                      ),
                                    ),
                                  ),
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
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 36.0, bottom: 8),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TaskWidget(
                        kycdone: boolKYC,
                        title: "01",
                        text: 'Complete KYC',
                        svgPath: "assets/images/task/key.png",
                        color: Color(0xffF6EDD2),
                      ),
                      TaskWidget(
                        kycdone: false,
                        title: "02",
                        text: 'Create Category',
                        svgPath: "assets/images/task/burger.png",
                        color: Color(0xffD6F4DE),
                      ),
                      TaskWidget(
                        kycdone: false,
                        title: "03",
                        svgPath: "assets/images/task/moneymoji.png",
                        text: 'Set Limit to categ..',
                        color: Color(0xffFBEBCE),
                      ),
                      TaskWidget(
                        kycdone: false,
                        title: "04",
                        svgPath: "assets/images/task/lap_man.png",
                        text: 'Add apps to categ..',
                        color: Color(0xffD3D6F1),
                      ),
                      TaskWidget(
                        kycdone: false,
                        title: "05",
                        svgPath: "assets/images/task/cash_bag.png",
                        text: 'Make on taxn',
                        color: Color(0xffF7F0DC),
                      ),
                      TaskWidget(
                        kycdone: false,
                        title: "06",
                        svgPath: "assets/images/task/cash.png",
                        text: 'Make 5 taxn in each category',
                        color: Color(0xffEEECE2),
                      ),
                    ],
                  ),
                ),
                // taskWidget(boolKYC),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 32.0, bottom: 8),
                  child: RichText(
                    text: const TextSpan(
                      text: "Offers & Rewards",
                      style: TextStyle(
                        color: Color(0xff525251),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                OfferWidget(),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 32.0, bottom: 8),
                  child: RichText(
                    text: const TextSpan(
                      text: "Blogs",
                      style: TextStyle(
                        color: Color(0xff525251),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const BlogsWidget(),
                const EndWidegt(),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            // margin: const EdgeInsets.all(16),
            height: 56,
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffEEEEEE), width: 1),
              borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
              color: Colors.white,
              boxShadow: [
                // BoxShadow(
                //   color: Colors.grey, //New
                //   blurRadius: 25.0,
                //   offset: Offset(-10, 10),
                //   spreadRadius: 20,
                // ),
                // BoxShadow(
                //   color: Colors.grey, //New
                //   blurRadius: 25.0,
                //   offset: Offset(-10, -10),
                //   spreadRadius: 20,
                // ),
                BoxShadow(
                  // offset: Offset(0, 2),
                  color: Colors.grey,
                  blurStyle: BlurStyle.outer,
                  blurRadius: 3,
                )
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
                  callback: changeBottomtab,
                ),
                Container(
                  width: selected[3]! ? 108 : 68,
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
                            alignment: PlaceholderAlignment.middle,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: selected[3]! ? 18 : 24,
                                    padding:
                                        EdgeInsets.all(selected[3]! ? 4 : 4),
                                    child: SvgPicture.asset(
                                      "assets/images/Vectoraward.svg",
                                      width: selected[3]! ? 18 : 20,
                                      color: selected[3]!
                                          ? const Color(0xff303F9F)
                                          : const Color(0xFFB7B7B7),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  selected[3]!
                                      ? const Text(
                                          "Award",
                                          style: TextStyle(
                                            color: Color(0xff303F9F),
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      : const Text(
                                          "",
                                        ),
                                ]),
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
