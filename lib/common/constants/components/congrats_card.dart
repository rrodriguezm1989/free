import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:flutter/material.dart';

class CongratsCard extends StatelessWidget {
  final Size size;
  final _space = const SizedBox(height: 25);
  final String subtitle;
  final List<Widget> children;

  const CongratsCard({Key? key, required this.size, required this.subtitle, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .95,
      padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: secondary, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          const Icon(
            Icons.check_circle_rounded,
            color: Colors.white,
            size: 70,
          ),
          _space,
          getTitle('Felicidades!'),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          _space,
          ...children
        ],
      ),
    );
  }

  Widget getTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}