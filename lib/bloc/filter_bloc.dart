import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:filter_bloc/data/data.dart';
import 'package:flutter/material.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  var selectedStatus = 'All';
  var selectedType = 'All';

  Data data = Data();

  FilterBloc() : super(FilterInitial(selectedStatus: '', selectedType: 'All')) {
    on<FilterEvent>((event, emit) {
      if (event is StatusChangedEvent) {
        selectedStatus = event.newStatus;
        emit(StatusState(status: selectedStatus, type: selectedType));
        log(selectedStatus);
      }
      if (event is TypeChangedEvent) {
        selectedType = event.newType;
        emit(TypeState(status: selectedStatus, type: selectedType));
        log(selectedType);
      }
      if (event is CourseChangedEvent) {
        for (var element in getCourseList) {
          if (element['name'] == event.courseName.toString()) {
            element['isChecked'] = event.newValue;
          }

          //if All is checked...all others are checked
          if (event.courseName.toString() == 'All') {
            for (var ele in getCourseList) {
              ele['isChecked'] = event.newValue;
            }
          }

          //if all is checked...'ALL' is checked
          for (int i = 1; i < getCourseList.length; i++) {
            if (getCourseList[i]['isChecked'] == false) {
              getCourseList[0]['isChecked'] = false;

              break;
            } else {
              getCourseList[0]['isChecked'] = true;
            }
          }

          emit(CourseState(course: element));
        }
      }
      if (event is Clear) {
        var course = getCourseList;
        for (var element in course) {
          element['isChecked'] = false;
        }
        emit(ClearState(course: course, clearStatus: 'All', clearType: 'All'));
      }
      if (event is Apply) {
        _displaySelectedData(event);
      }
    });
  }

  List<String> get getStatusList {
    return data.filterStatus;
  }

  List<String> get getTypeList {
    return data.filterType;
  }

  List<Map> get getCourseList {
    return data.filterCourse;
  }

  get selectedStatusValue {
    return selectedStatus;
  }

  get selectedTypeValue {
    return selectedType;
  }

  _displaySelectedData(event) {
    showDialog(
        context: event.context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Data'),
              content: Column(
                children: [
                  Text('Status:\n $selectedStatus'),
                  const SizedBox(height: 20),
                  Text('Type:\n $selectedType'),
                  const SizedBox(height: 20),
                  const Text('Courses'),
                  Column(
                    children: getCourseList.map((courses) {
                      if (courses['isChecked'] == true) {
                        return Text(courses['name']);
                      }
                      return Container();
                    }).toList(),
                  ),
                ],
              ),
            ));
  }
}
