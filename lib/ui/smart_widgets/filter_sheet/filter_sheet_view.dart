import 'package:LIFFT/style/theme.dart';
import 'package:LIFFT/ui/smart_widgets/filter_sheet/filter_sheet_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FilterSheetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FilterSheetViewModel>.reactive(
        builder: (context, model, child) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: background_color1,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Filter ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Categories",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white),
                ),
                Wrap(
                  children: <Widget>[
                    if (model.fetchingBodyparts == false)
                      for (var category in model.categoriesData)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Chip(
                            label: Text(
                              category.name,
                            ),
                          ),
                        )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Body part",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white),
                ),
                Wrap(
                  children: <Widget>[
                    if (model.fetchingBodyparts == false)
                      for (var category in model.bodypartsData)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: FilterChip(
                            label: Text(
                              category.name,
                            ),
                            onSelected: (bool value) {},
                          ),
                        )
                  ],
                ),
              ],
            ),
          );
        },
        viewModelBuilder: () => FilterSheetViewModel());
  }
}
