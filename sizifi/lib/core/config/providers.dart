import 'package:sizifi/modules/authentication/notifiers/auth_state.dart';
import 'package:sizifi/modules/home/notifiers/store_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../modules/home/notifiers/order_state.dart';
import '../../modules/home/notifiers/tailor_state.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => AuthState(),
    lazy: false,
  ),
  ChangeNotifierProvider(
    create: (context) => StoreState(),
    lazy: false,
  ),
  ChangeNotifierProvider(
    create: (context) => OrderState(),
    lazy: false,
  ),
  ChangeNotifierProvider(
    create: (context) => TailorState(),
    lazy: false,
  ),
];