part of 'filter_bloc.dart';

@immutable
abstract class FilterState {}

class FilterInitial extends FilterState {
  final String selectedStatus;
  final String selectedType;
  FilterInitial({required this.selectedStatus, required this.selectedType});
}

// ignore: must_be_immutable
class StatusState extends FilterInitial {
  late String status;
  late String type;
  StatusState({required String status, required String type})
      : super(selectedStatus: status, selectedType: type);
}

// ignore: must_be_immutable
class TypeState extends FilterInitial {
  late String status;
  late String type;
  TypeState({required String status, required String type})
      : super(selectedStatus: status, selectedType: type);
}

// ignore: must_be_immutable
class CourseState extends FilterState {
  late Map course;
  CourseState({required this.course});
}

// ignore: must_be_immutable
class ClearState extends FilterState {
  String clearStatus = 'All';

  String clearType = 'All';
  List<Map> course;

  ClearState(
      {required String clearStatus,
      required String clearType,
      required this.course});
}

// ignore: must_be_immutable
class ApplyState extends FilterState {
  String status;
  String type;
  List<Map> course;
  ApplyState({required this.status, required this.type, required this.course});
}
