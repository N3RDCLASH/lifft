import 'package:LIFFT/ui/views/account/account_view.dart';
import 'package:LIFFT/ui/views/auth/auth_view.dart';
import 'package:LIFFT/ui/views/home/home_view.dart';
import 'package:LIFFT/ui/views/register/register_view.dart';
import 'package:LIFFT/ui/views/startup/startup_view.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  StartupView startupViewRoute;
  AuthView authViewRoute;
  HomeView homeViewRoute;
  AccountView accountViewRoute;
  RegisterView registerViewRoute;
}
