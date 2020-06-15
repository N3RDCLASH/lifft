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
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    Input(
                      label: "Search",
                      controller: model.searchTextEditingController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    (model.dataReady)
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: model.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ExerciseTile(model.data[index]);
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
