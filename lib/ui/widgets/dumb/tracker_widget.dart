import 'package:fathom_dnd/app/models/character.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

enum trackerType { level, hp, mn, st }

class TrackerWidget extends StatelessWidget {
  const TrackerWidget(
      {Key? key,
      this.character,
      this.tType = trackerType.level,
      this.borderColor = AppColors.grayLight,
      this.onTap})
      : super(key: key);
  final Character? character;
  final trackerType tType;
  final Color borderColor;
  final VoidCallback? onTap;

  factory TrackerWidget.hp(Character? character, VoidCallback onTap) =>
      TrackerWidget(
        character: character,
        tType: trackerType.hp,
        borderColor: AppColors.red,
        onTap: onTap,
      );

  factory TrackerWidget.mn(Character? character, VoidCallback onTap) =>
      TrackerWidget(
        character: character,
        tType: trackerType.mn,
        borderColor: AppColors.blue,
        onTap: onTap,
      );

  factory TrackerWidget.st(Character? character, VoidCallback onTap) =>
      TrackerWidget(
        character: character,
        tType: trackerType.st,
        borderColor: AppColors.green,
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: tType == trackerType.level
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Level ${character?.experienceSystem?.level}',
                    style: const TextStyle(
                      color: Color(0xffc8d3da),
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'EXP ${(character?.experienceSystem?.level ?? 0) * (character?.experienceSystem?.baseExp ?? 0)}/${character?.experienceSystem?.exp}',
                    style: const TextStyle(
                      color: Color(0xffc8d3da),
                      fontSize: 11,
                    ),
                  ),
                ],
              )
            : (tType == trackerType.hp
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${character?.trackerSystem?.hitPoints.base}/${character?.trackerSystem?.hitPoints.current}',
                        style: const TextStyle(
                          color: Color(0xffc8d3da),
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'HIT POINTS'.toUpperCase(),
                        style: const TextStyle(
                          color: Color(0xffc8d3da),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  )
                : (tType == trackerType.mn
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${character?.trackerSystem?.mana.base}/${character?.trackerSystem?.mana.current}',
                            style: const TextStyle(
                              color: Color(0xffc8d3da),
                              fontSize: 14,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'mana'.toUpperCase(),
                            style: const TextStyle(
                              color: Color(0xffc8d3da),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      )
                    : (tType == trackerType.st
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${character?.trackerSystem?.stamina.base}/${character?.trackerSystem?.stamina.current}',
                                style: const TextStyle(
                                  color: Color(0xffc8d3da),
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'stamina'.toUpperCase(),
                                style: const TextStyle(
                                  color: Color(0xffc8d3da),
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          )
                        : null))),
      ),
    );
  }
}
