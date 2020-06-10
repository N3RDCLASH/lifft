import 'package:LIFFT/app/locator.dart';
import 'package:LIFFT/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  void navigateToHome() {
    _navigationService.replaceWith(Routes.homeViewRoute);
  }
}
