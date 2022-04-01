part of 'filter_bloc.dart';

@immutable
abstract class FilterState {}

class FilterInitial extends FilterState {
  final String selectedStatus;
  final String selectedType;
  FilterInitial({required this.selectedStatus, required this.selectedType});
}

class StatusChangedState extends FilterInitial{
  StatusChangedState({required String selectedStatus, required String selectedType}) : super(selectedStatus: selectedStatus, selectedType: selectedType);
}
