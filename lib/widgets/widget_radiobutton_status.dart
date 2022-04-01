import 'package:filter_bloc/bloc/filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetRadiobuttonStatus extends StatelessWidget {
  const WidgetRadiobuttonStatus({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     FilterBloc bloc = BlocProvider.of<FilterBloc>(context);
     return Column(
        children: bloc.getStatusList
            .map((filter) => ListTile(
                  leading: Radio<String>(
                    groupValue: bloc.getStatusList,
                    value: filter,
                    onChanged: (value) {
                      _handleRadioValueChange(value);
                    },
                  ),
                  title: Text(filter),
                ))
            .toList());
  }
}