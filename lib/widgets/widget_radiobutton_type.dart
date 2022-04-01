import 'package:filter_bloc/bloc/filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetRadiobuttonType extends StatelessWidget {
  const WidgetRadiobuttonType({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  FilterBloc bloc = BlocProvider.of<FilterBloc>(context);
    return Column(
        children: bloc.getTypeList
            .map((filter) => ListTile(
                  leading: Radio<String>(
                    groupValue: bloc.selectedTypeValue,
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
