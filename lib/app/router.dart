import 'package:LIFFT/ui/views/auth/auth_view.dart';
import 'package:LIFFT/ui/views/startup/startup_view.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  StartupView startupViewRoute;
  AuthView authViewRoute;
}
