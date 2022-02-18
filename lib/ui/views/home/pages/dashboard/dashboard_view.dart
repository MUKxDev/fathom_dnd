import 'package:fathom_dnd/app/theme/app_colors.dart';
import 'package:fathom_dnd/app/theme/app_text_theme.dart';
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
            title: const Text('dashboard'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalSpaceMedium(context),
                Image.asset(
                  Constants.fathomLogo,
                  height: 80,
                  fit: BoxFit.contain,
                ),
                verticalSpaceMedium(context),
                Text(
                  'Display Name: ${model.user?.displayName}',
                ),
                SelectableText(
                  'UID: ${model.user?.uid}',
                  style: AppTextTheme.textTheme.caption
                      ?.copyWith(color: AppColors.grayLight),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
