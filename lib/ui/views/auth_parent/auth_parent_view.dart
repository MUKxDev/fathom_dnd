import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './auth_parent_view_model.dart';

class AuthParentView extends StatelessWidget {
  const AuthParentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthParentViewModel>.reactive(
      viewModelBuilder: () => AuthParentViewModel(),
      onModelReady: (AuthParentViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        AuthParentViewModel model,
        Widget? child,
      ) {
        return AutoRouter(
          key: model.routerService.authKey,
        );
      },
    );
  }
}
