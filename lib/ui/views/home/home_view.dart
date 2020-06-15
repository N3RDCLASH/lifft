import 'package:LIFFT/models/menu_item_model.dart';
import 'package:LIFFT/style/theme.dart';
import 'package:LIFFT/ui/views/home/home_viewmodel.dart';
import 'package:LIFFT/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: model.menuItems[model.selectedMenuIndex].appBar ??
            AppBar(
              backgroundColor: background_color1,
              elevation: 0,
              actions: <Widget>[
                IconButton(icon: Icon(Icons.settings), onPressed: () {})
              ],
            ),
        body: model.menuItems[model.selectedMenuIndex].page,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: buildNavBarItems(context, model),
          onTap: (int index) => {model.selectMenuItem(index)},
          currentIndex: model.selectedMenuIndex,
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  List<BottomNavigationBarItem> buildNavBarItems(context, model) {
    List<BottomNavigationBarItem> items = List();

    for (var i = 0; i < model.menuItems.length; i++) {
      MenuItem currentMenuItem = model.menuItems[i];

      BottomNavigationBarItem barItem = BottomNavigationBarItem(
        title: Text(currentMenuItem.name),
        icon: currentMenuItem.icon,
      );

      items.add(barItem);
    }

    return items;
  }
}
