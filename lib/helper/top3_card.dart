import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TopDriverCard extends StatelessWidget {
  final Color teamColor;
  final String? driverPhoto;
  final String? driverCode;
  final String? time;
  final String? points;
  final String? position;
  final double? height;
  const TopDriverCard({
    super.key,
    required this.teamColor,
    required this.driverPhoto,
    required this.driverCode,
    required this.time,
    required this.points,
    required this.position,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            // padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
            width: MediaQuery.of(context).size.width * 0.22,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: teamColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.circular(20),
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero,
              ),
            ),
            child: CachedNetworkImage(
            imageUrl: driverPhoto!,
            fit: BoxFit.fitHeight,
          ),
          ),
          const Expanded(child: SizedBox()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Pos: ${position!}',
                style: const TextStyle(
                  fontFamily: 'Formula1',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Text(
                driverCode!,
                style: const TextStyle(
                  fontFamily: 'Formula1',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Text(
                'Points: ${points!}',
                style: const TextStyle(
                  fontFamily: 'Formula1',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Text(
                'Time: ${time!}',
                style: const TextStyle(
                  fontFamily: 'Formula1',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
