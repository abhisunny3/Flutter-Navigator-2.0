import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'my_v_router_test.dart';
import 'myvrouter.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyVApp()); // Velocity x Navigator 2.0
  //runApp(MyVRouterApp()); // VRouter Navigator 2.0
}
