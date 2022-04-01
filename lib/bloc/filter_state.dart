// ignore_for_file: must_be_immutable

part of 'filter_bloc.dart';

@immutable
abstract class FilterState {}

class FilterInitial extends FilterState {
  final String selectedStatus;
  final String selectedType;
  FilterInitial({required this.selectedStatus, required this.selectedType});
}

class StatusState extends FilterInitial {
  late String status;
  late String type;
  StatusState({required String status, required String type})
      : super(selectedStatus: status, selectedType: type);
}

class TypeState extends FilterInitial {
  late String status;
  late String type;
  TypeState({required String status, required String type})
      : super(selectedStatus: status, selectedType: type);
}

class CourseState extends FilterState {
  late Map course;
  CourseState({required this.course});
}

class ClearState extends FilterState {
  late String clearStatus;

  late String clearType;
  List<Map> course;

  ClearState(
      {required String clearStatus,
      required String clearType,
      required this.course});
}
