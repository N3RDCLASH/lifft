import 'package:LIFFT/models/exercise_model.dart';
import 'package:LIFFT/style/theme.dart';
import 'package:LIFFT/ui/dumb_widgets/Input.dart';
import 'package:LIFFT/ui/views/exercises/exercises_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ExercisesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExercisesViewModel>.reactive(
        builder: (context, model, child) => GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: background_color1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Exercises",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Flexible(
                          child: Input(
                            label: "Search",
                            controller: model.searchTextEditingController,
                            onChanged: model.filterExercises,
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          color: Colors.white,
                          iconSize: 34,
                          icon: Icon(Icons.filter_list),
                          onPressed: () {
                            showBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    color: background_color1,
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Filter -  ${model.data.length}",
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
                                      ],
                                    ),
                                  );
                                });
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    (model.dataReady)
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: model.exerciseList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ExerciseTile(model.exerciseList[index]);
                              },
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => ExercisesViewModel());
  }
}

class ExerciseTile extends ViewModelWidget<ExercisesViewModel> {
  final Exercise _exercise;

  ExerciseTile(this._exercise);
  @override
  Widget build(BuildContext context, ExercisesViewModel model) {
    return ListTile(
      contentPadding: EdgeInsets.only(top: 10),
      title: Container(
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 24,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _exercise.name,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  _exercise.mainCategory,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white54,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
