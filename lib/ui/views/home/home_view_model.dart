import 'package:fathom_dnd/app/core/custom_base_view_model.dart';

import '../../../app/locator/locator.dart';
import '../../../app/services/app/router_service.dart';

class HomeViewModel extends CustomBaseViewModel {
/* -------------------------------------------------------------------------- */
/*                                  Services                                  */
/* -------------------------------------------------------------------------- */
  final RouterService routerService = locator<RouterService>();
  Future<void> init() async {}
}
