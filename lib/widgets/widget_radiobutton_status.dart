import 'package:filter_bloc/bloc/filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetRadiobuttonStatus extends StatelessWidget {
  const WidgetRadiobuttonStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getStatusList(context);
   
  }

  getStatusList(BuildContext context) {
    FilterBloc bloc = BlocProvider.of<FilterBloc>(context, listen: true);
    return Column(
        children: bloc.getStatusList
            .map((filter) => ListTile(
                  leading: Radio<String>(
                    groupValue: bloc.selectedStatusValue,
                    value: filter,
                    onChanged: (value) {
                      BlocProvider.of<FilterBloc>(context)
                          .add(StatusChangedEvent(newStatus: value!));
                    },
                  ),
                  title: Text(filter),
                ))
            .toList());
  }
}
