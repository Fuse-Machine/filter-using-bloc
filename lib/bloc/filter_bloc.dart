import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:filter_bloc/data.dart';
import 'package:meta/meta.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  var selectedStatus = 'All';
  var selectedType = 'All';

  Data data = Data();

  FilterBloc()
      : super(FilterInitial(selectedStatus: 'All', selectedType: 'All')) {
    on<FilterEvent>((event, emit) {
      if (event is StatusChangedEvent) {
        selectedStatus = event.newStatus;
        log(selectedStatus);
      }
      if (event is TypeChangedEvent) {
        selectedType = event.newType;
        log(selectedType);
      }
      if (event is CourseChangedEvent) {
        //log(event.newValue.toString());
        //log(event.courseName.toString());
        for (var element in getCourseList) {
          if (element['name'] == event.courseName.toString()) {
            element['isChecked'] = event.newValue;
          }
          log(element.toString());
        }
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
}
