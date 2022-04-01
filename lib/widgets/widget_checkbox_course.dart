import 'package:filter_bloc/bloc/filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetCheckboxCourse extends StatelessWidget {
  const WidgetCheckboxCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FilterBloc bloc = BlocProvider.of<FilterBloc>(context);

    return Column(
      children: bloc.getCourseList.map((courses) {
        return CheckboxListTile(
            value: courses["isChecked"],
            title: Text(courses["name"]),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (newValue) {
              BlocProvider.of<FilterBloc>(context).add(CourseChangedEvent(
                  courseName: courses["name"], newValue: newValue!));
              // setState(() {
              //   courses['isChecked'] = newValue;

              //   for (int i = 1; i < _filterByCourse.length; i++) {
              //     if (_filterByCourse[i]['isChecked'] == false) {
              //       _filterByCourse[0]['isChecked'] = false;

              //       break;
              //     } else {
              //       _filterByCourse[0]['isChecked'] = true;
              //     }
              //   }
              // });

              // //Setting all true if All is checked true
              // if (courses['name'] == 'All') {
              //   for (var element in _filterByCourse) {
              //     element['isChecked'] = newValue;
              //   }
              // }
              //
            });
      }).toList(),
    );
  }
}
