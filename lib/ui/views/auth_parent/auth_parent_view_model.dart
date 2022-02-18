import 'package:fathom_dnd/app/core/custom_base_view_model.dart';
import 'package:fathom_dnd/app/locator/locator.dart';
import 'package:fathom_dnd/app/services/app/router_service.dart';

class AuthParentViewModel extends CustomBaseViewModel {
  /* -------------------------------------------------------------------------- */
  /*                                  Services                                  */
  /* -------------------------------------------------------------------------- */
  final RouterService routerService = locator<RouterService>();

  Future<void> init() async {}
}
