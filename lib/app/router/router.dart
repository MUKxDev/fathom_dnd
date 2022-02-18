import 'package:auto_route/auto_route.dart';
import 'package:fathom_dnd/ui/views/auth_parent/auth_parent_view.dart';
import 'package:fathom_dnd/ui/views/auth_parent/pages/login/login_view.dart';
import 'package:fathom_dnd/ui/views/auth_parent/pages/sign_up/sign_up_view.dart';

import 'package:fathom_dnd/ui/views/home/home_view.dart';
import 'package:fathom_dnd/ui/views/home/pages/dashboard/dashboard_view.dart';
import 'package:fathom_dnd/ui/views/startup/startup_view.dart';

export './router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute>[
    AdaptiveRoute(page: StartupView, initial: true),
    AdaptiveRoute(
      page: HomeView,
      children: [
        AutoRoute(page: DashboardView, initial: true),
      ],
    ),
    AdaptiveRoute(
      page: AuthParentView,
      children: [
        AutoRoute(page: LoginView, initial: true),
        AutoRoute(page: SignUpView),
      ],
    ),
  ],
)
class $FathomDndRouter {}
