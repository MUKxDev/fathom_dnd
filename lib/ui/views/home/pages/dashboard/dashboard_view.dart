import 'package:fathom_dnd/app/theme/app_colors.dart';
import 'package:fathom_dnd/app/theme/app_text_theme.dart';
import 'package:fathom_dnd/ui/widgets/dumb/icon_button_widget.dart';
import 'package:fathom_dnd/ui/widgets/dumb/tracker_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../app/utils/constants.dart';
import '../../../../../app/utils/ui_helpers.dart';
import './dashboard_view_model.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      onModelReady: (DashboardViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        DashboardViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            toolbarHeight: 65,
            title: Column(
              children: [
                Text(
                  '${model.character?.basicInfo.name}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '${model.character?.basicInfo.race}',
                    children: [
                      const TextSpan(
                        text: ' • ',
                        style: TextStyle(
                          color: AppColors.red,
                          fontSize: 11,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                          text: '${model.character?.basicInfo.characterClass}')
                    ],
                    style: const TextStyle(
                      color: Color(0xffc8d3da),
                      fontSize: 11,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TrackerWidget(
                character: model.character,
              )
            ],
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                color: AppColors.gray,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: IconButtonWidget(
                          text: 'MONEY',
                          icon: const Icon(Icons.monetization_on_sharp),
                          onTap: () {},
                        ),
                      ),
                      horizontalSpaceSmall(context),
                      Container(
                        width: 66,
                        height: 66,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.purple,
                            width: 2,
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              "${model.character?.basicInfo.image}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      horizontalSpaceSmall(context),
                      Expanded(
                        child: IconButtonWidget(
                          text: 'INV',
                          icon: const Icon(Icons.account_balance_wallet),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceSmall(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TrackerWidget.mn(model.character, () {}),
                      TrackerWidget.st(model.character, () {}),
                      TrackerWidget.hp(model.character, () {}),
                    ],
                  ),
                ]),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff202a33),
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xff283743),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: double.infinity,
                                height: 46,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 46,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 9,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: const [
                                            SizedBox(
                                              child: Text(
                                                "Passive skills,  Class skills",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        right: 9,
                                      ),
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
