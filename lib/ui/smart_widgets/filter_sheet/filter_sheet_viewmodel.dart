import 'package:LIFFT/app/locator.dart';
import 'package:LIFFT/models/bodypart_model.dart';
import 'package:LIFFT/models/category_model.dart';
import 'package:LIFFT/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class FilterSheetViewModel extends MultipleFutureViewModel {
  FirestoreService _firestoreService = locator<FirestoreService>();
  List<Category> get categoriesData => dataMap["categoriesFuture"];
  List<Bodypart> get bodypartsData => dataMap["bodypartsFuture"];

  bool get fetchingCategories => busy("categoriesFuture");
  bool get fetchingBodyparts => busy("bodypartsFuture");

  @override
  Map<String, Future Function()> get futuresMap => {
        "categoriesFuture": _firestoreService.getCategories,
        "bodypartsFuture": _firestoreService.getBodyparts,
      };
}
