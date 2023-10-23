import 'package:cached_network_image/cached_network_image.dart';
import 'package:f1_stats/constants/team_logos.dart';
import 'package:flutter/material.dart';

class DriverDetails extends StatefulWidget {
  final String? drivercode;
  final String? driverNumber;
  final String? driverGivenName;
  final String? driverFamilyName;
  final String? driverConstructor;
  final String? driverNationality;
  final String? driverDOB;
  final String? driverPoints;
  final String? driverWins;
  // final String? driverConstructorId;
  const DriverDetails({
    super.key,
    required this.drivercode,
    required this.driverNumber,
    required this.driverGivenName,
    required this.driverFamilyName,
    required this.driverConstructor,
    required this.driverNationality,
    required this.driverDOB,
    required this.driverPoints,
    required this.driverWins,
    // required this.driverConstructorId,
  });

  @override
  State<DriverDetails> createState() => _DriverDetailsState();
}

class _DriverDetailsState extends State<DriverDetails> {
  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.driverGivenName} ${widget.driverFamilyName}',
          style: const TextStyle(
            fontFamily: 'Formula1',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color.fromRGBO(225, 6, 0, 1),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  // color: teamColorsMap[widget.driverConstructorId]!.withOpacity(0.6),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: CachedNetworkImage(
                  imageUrl: driverMap[widget.drivercode]!,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const Text(
              'Personal Details',
              style: TextStyle(
                fontFamily: 'Formula1',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(225, 6, 0, 1),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Date of Birth:   ',
                    style: TextStyle(
                      fontFamily: 'Formula1',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: widget.driverDOB!,
                    style: const TextStyle(
                      fontFamily: 'Formula1',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Nationality:   ',
                    style: TextStyle(
                      fontFamily: 'Formula1',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: widget.driverNationality!,
                    style: const TextStyle(
                      fontFamily: 'Formula1',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Season Details',
              style: TextStyle(
                fontFamily: 'Formula1',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(225, 6, 0, 1),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Driver Number:   ',
                    style: TextStyle(
                      fontFamily: 'Formula1',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: widget.driverNumber!,
                    style: const TextStyle(
                      fontFamily: 'Formula1',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Driver Code:   ',
                    style: TextStyle(
                      fontFamily: 'Formula1',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: widget.drivercode!,
                    style: const TextStyle(
                      fontFamily: 'Formula1',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Constructor:   ',
                    style: TextStyle(
                      fontFamily: 'Formula1',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: widget.driverConstructor!,
                    style: const TextStyle(
                      fontFamily: 'Formula1',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Wins:   ',
                    style: TextStyle(
                      fontFamily: 'Formula1',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: widget.driverWins!,
                    style: const TextStyle(
                      fontFamily: 'Formula1',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
    } catch (e) {
      return const Scaffold(body: Center(child: Text('Some Error occurred',style: TextStyle(fontFamily: 'Formula1', fontSize: 20, fontWeight: FontWeight.w500, color: Color.fromRGBO(225, 6, 0, 1),),),));
    }
  }
}
