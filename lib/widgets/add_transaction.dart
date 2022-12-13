import 'package:flutter/material.dart';

Widget addTransaction(BuildContext context) {
  // bool isClicked = true;
  FocusNode quickNote = FocusNode();
  FocusNode amount = FocusNode();
  TextEditingController quickNoteText = TextEditingController();
  TextEditingController amountText = TextEditingController();
  Map<int, bool> isClicked = {0: false, 1: false, 2: false};

  quickNote.addListener(() {
    if (quickNote.hasFocus) {
      quickNoteText.text = "Lorem Ipsum is simply dummy text........";
    }
  });
  amount.addListener(() {
    if (amount.hasFocus) {
      amountText.text = "500";
    }
  });
  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    choosePayment(int x) {
      setState(() {
        for (int i = 0; i < 3; i++) {
          if (x == i) {
            isClicked[x] != isClicked[x];
            print("object");
          } else {
            isClicked[i] = false;
          }
        }
      });
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 56,
          margin: const EdgeInsets.symmetric(vertical: 24),
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE))),
          ),
          child: Row(
            children: const [
              Icon(
                Icons.arrow_back_rounded,
                color: Color(0xff2F2F30),
                size: 24,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Adding Transaction",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            // height: 452,
            // width: 329,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter Spend amount",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xff0C0C0C),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Enter the amount that you have spend without using zero balance.",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF757575),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: TextField(
                    focusNode: amount,
                    controller: amountText,
                    decoration: InputDecoration(
                      labelText: "Amount",
                      labelStyle: const TextStyle(
                        color: Color(0xff303F9F),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xFF303F9F)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xFF303F9F)),
                      ),
                      focusColor: const Color(0xff303F9F),
                    ),
                    cursorColor: Color(0xff303F9F),
                  ),
                ),
                const Text(
                  "Enter Date",
                  style: TextStyle(
                    color: Color(0xff0C0C0C),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFFEEEEEE)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFF303F9F)),
                    ),
                    focusColor: const Color(0xff303F9F),
                  ),
                  cursorColor: Color(0xff303F9F),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Mode of payment",
                  style: TextStyle(
                    color: Color(0xff0C0C0C),
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isClicked[0]! ? Color(0xff303F9F) : Colors.white,
                        fixedSize: const Size(101.33, 32),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Color(0xff303F9F)),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        // isClicked[0] = !isClicked[0];
                        choosePayment(0);
                      },
                      child: const Text(
                        "UPI",
                        style: TextStyle(
                          color: Color(0xFF303F9F),
                          fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: const Size(101.33, 32),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Color(0xff303F9F)),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        // isClicked[1] = !isClicked[1];
                        choosePayment(1);
                      },
                      child: const Text(
                        "Card",
                        style: TextStyle(
                          color: Color(0xFF303F9F),
                          fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: const Size(101.33, 32),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Color(0xff303F9F)),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        // isClicked[2] = !isClicked[2];
                        choosePayment(2);
                      },
                      child: const Text(
                        "Cash",
                        style: TextStyle(
                          color: Color(0xFF303F9F),
                          fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Quick note",
                  style: TextStyle(
                    color: Color(0xff0C0C0C),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  scrollPadding: const EdgeInsets.only(bottom: 40),
                  controller: quickNoteText,
                  focusNode: quickNote,
                  decoration: InputDecoration(
                    hintText: "Quick note",
                    hintStyle: const TextStyle(
                      color: Color(0xffCBCACB),
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFFEEEEEE)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFF303F9F)),
                    ),
                    focusColor: const Color(0xff303F9F),
                  ),
                  cursorColor: Color(0xff303F9F),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF303F9F),
              fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              // isClicked = !isClicked;
            },
            child: const Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  });
}
