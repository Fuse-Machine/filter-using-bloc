part of 'filter_bloc.dart';

@immutable
abstract class FilterState {}

class FilterInitial extends FilterState {
  final String selectedStatus;
  final String selectedType;
  FilterInitial({required this.selectedStatus, required this.selectedType});
}

class RadioStatusChanged extends FilterState {
  final String filterStatus;
  RadioStatusChanged({required this.filterStatus});
}

class RadioTypeChanged extends FilterState {
  final String filterType;
  RadioTypeChanged({required this.filterType});
}

class CheckboxCourseChanged extends FilterState {}

class StatusState extends FilterState {}
