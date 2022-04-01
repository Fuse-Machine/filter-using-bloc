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
      if (event is RadioStatusClicked) {
        event.filterStatus = event.value;
        emit(RadioTypeChanged(filterType: event.filterStatus));
      }
    });
  }

  List<String> get getStatusList {
    return data.filterStatus;
  }
  
}
