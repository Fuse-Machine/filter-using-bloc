import 'package:filter_bloc/bloc/filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetCheckboxCourse extends StatelessWidget {
  const WidgetCheckboxCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        if (state is CourseState) {
          return _getCourseList(context);
        } else {
          return _getCourseList(context);
        }
      },
    );
  }

  _getCourseList(BuildContext context) {
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
              //
            });
      }).toList(),
    );
  }
}
