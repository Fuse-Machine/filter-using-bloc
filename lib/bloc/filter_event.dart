part of 'filter_bloc.dart';

@immutable
abstract class FilterEvent {}

// ignore: must_be_immutable
class StatusChangedEvent extends FilterEvent {
  String newStatus;
  StatusChangedEvent({required this.newStatus});
}

// ignore: must_be_immutable
class TypeChangedEvent extends FilterEvent {
  String newType;
  TypeChangedEvent({required this.newType});
}

// ignore: must_be_immutable,
class CourseChangedEvent extends FilterEvent {
  bool newValue;

  String courseName;
  CourseChangedEvent({required this.courseName, required this.newValue});
}
