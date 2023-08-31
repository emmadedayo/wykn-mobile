import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionBarWidget extends StatelessWidget {
  final int? number;
  final String assetName;

  const ActionBarWidget({
    Key? key,
    this.number,
    required this.assetName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 21,
            backgroundColor: const Color(0xFFF5F5F5),
            child: SvgPicture.asset('assets/svg/$assetName.svg'),
          ),
          Positioned(
            top: -4,
            right: 4,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: const Color(0xFFFF3F3F),
              child: number == null
                  ? null
                  : Text(
                      '$number',
                      textAlign: TextAlign.center,
                      style: themeData.textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
