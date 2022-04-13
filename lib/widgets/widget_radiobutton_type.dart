import 'package:filter_bloc/bloc/filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetRadiobuttonType extends StatelessWidget {
  const WidgetRadiobuttonType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        if (state is StatusState) {
          return getTypeList(context);
        }
        return getTypeList(context);
      },
    );
  }

  getTypeList(BuildContext context) {
    FilterBloc bloc = BlocProvider.of<FilterBloc>(context);
    return Column(
        children: bloc.getTypeList
            .map((filter) => ListTile(
                  leading: Radio<String>(
                    groupValue: bloc.selectedTypeValue,
                    value: filter,
                    onChanged: (value) {
                      BlocProvider.of<FilterBloc>(context)
                          .add(TypeChangedEvent(newType: value!));
                    },
                  ),
                  title: Text(filter),
                ))
            .toList());
  }
}
