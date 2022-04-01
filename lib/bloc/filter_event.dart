part of 'filter_bloc.dart';

@immutable
abstract class FilterEvent {}

class RadioTypeClicked extends FilterEvent {
  late final String filterType;
  final String value;
  RadioTypeClicked({required this.filterType, required this.value});
}

// ignore: must_be_immutable
class RadioStatusClicked extends FilterEvent {
    String filterStatus;
    String value;
  RadioStatusClicked({required this.filterStatus, required this.value});
}

class CheckboxCourseClicked extends FilterEvent {}
