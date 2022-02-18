import 'package:fathom_dnd/app/core/custom_base_view_model.dart';
import 'package:fathom_dnd/app/locator/locator.dart';
import 'package:fathom_dnd/app/router/router.dart';
import 'package:fathom_dnd/app/services/api/auth_service.dart';
import 'package:fathom_dnd/app/services/app/router_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardViewModel extends CustomBaseViewModel {
/* -------------------------------------------------------------------------- */
/*                                  Services                                  */
/* -------------------------------------------------------------------------- */
  final RouterService _routerService = locator<RouterService>();
  final AuthService _authService = locator<AuthService>();

  late User? _user;
  User? get user => _user;
  Future<void> init() async {
    setBusy(true);

    _user = _authService.stackedAuth.currentUser;
    // Make sure there is a signed in user
    if (_user == null) {
      await _authService.stackedAuth.currentUser?.reload();
      if (_authService.stackedAuth.currentUser == null) {
        // if there is no signed in user navigate to auth
        _routerService.router.pushAndPopUntil(
          const AuthParentRoute(),
          predicate: (route) => false,
        );
      }
    }

    setBusy(false);
  }
}
