import 'package:LIFFT/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  init() {
    navigateToAuth();
  }

  void navigateToAuth() {
    _navigationService.navigateTo('/auth-view-route');
  }

  void navigateToHome() {
    _navigationService.navigateTo('/auth-view-route');
  }
}
