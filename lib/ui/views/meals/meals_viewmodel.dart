import 'package:LIFFT/app/locator.dart';
import 'package:LIFFT/app/router.gr.dart';
import 'package:LIFFT/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MealsViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  handleStartup() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();
    if (!hasLoggedInUser) {
      print("no");
      navigateToAuth();
    } else {
      print("yes");
      navigateToHome();
    }
    // navigateToAuth();
  }

  void navigateToAuth() {
    _navigationService.navigateTo(Routes.authViewRoute);
  }

  void navigateToHome() {
    _navigationService.navigateTo(Routes.homeView);
  }
}
