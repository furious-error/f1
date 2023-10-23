import "package:flutter/material.dart";

class DetailCard extends StatelessWidget {
  final String? title;
  final String? date;
  final String? time;
  final bool showicon;
  final Widget? nextPage;
  const DetailCard(
      {super.key,
      this.title,
      this.date,
      this.time,
      required this.showicon,
      this.nextPage});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: showicon ? () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => nextPage!,
          ),
        );
      } : () {},
      child: Container(
        // margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        height: size.height * 0.1,
        padding: const EdgeInsets.all(15),
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(20),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.grey.withOpacity(0.5),
        //       spreadRadius: 0,
        //       blurRadius: 0,
        //       // offset: const Offset(0, 2),
        //     ),
        //   ],
        // ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              date!,
              style: TextStyle(
                fontFamily: 'Formula1',
                fontSize: size.height * 0.015,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: size.width * 0.025,
            ),
            Container(
              width: 1,
              height: size.height * 0.05,
              color: const Color.fromRGBO(225, 6, 0, 1),
            ),
            SizedBox(
              width: size.width * 0.025,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: TextStyle(
                    fontFamily: 'Formula1',
                    fontSize: size.height * 0.02,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: size.width * 0.02,
                ),
                Text(
                  time!,
                  style: TextStyle(
                    fontFamily: 'Formula1',
                    fontSize: size.height * 0.015,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            // SizedBox(width: size.width*0.18,),
            const Expanded(child: SizedBox()),
            showicon == true
                ? Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                      size: size.height * 0.03,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
