import 'dart:developer';

import 'package:filter_bloc/bloc/filter_bloc.dart';
import 'package:filter_bloc/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        centerTitle: false,
        title: const Text(
          'Filters',
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      color: Colors.grey[400],
                      child: const Text(
                        'status',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    _radioWidgetFilterStatus(context),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      color: Colors.grey[400],
                      child: const Text(
                        'Type',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    _radioWidgetFilterType(context),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      color: Colors.grey[400],
                      child: const Text(
                        'Courses',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    _checkBoxWidgetCourse(),
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  _radioWidgetFilterStatus(context) {
    Data data = Data();
    data.filterStatus.insert(0, 'All');
    return Column(
        children: data.filterStatus
            .map((filter) => ListTile(
                  leading: Radio<String>(
                    groupValue: data.filterStatusValue,
                    value: filter,
                    onChanged: (value) {
                      _handleRadioValueChange(value);
                    },
                  ),
                  title: Text(filter),
                ))
            .toList());
  }

  _radioWidgetFilterType(BuildContext context) {
    Data data = Data();

    data.filterType.insert(0, 'All');
    FilterBloc bloc = BlocProvider.of<FilterBloc>(context);
    return Column(
        children: bloc.getStatusList
            .map((filter) => ListTile(
                  leading: Radio<String>(
                    groupValue: data.filterTypeValue,//initialValue
                    value: filter,
                    onChanged: (value) {
                      
                    },
                  ),
                  title: Text(filter),
                ))
            .toList());
  }

  _checkBoxWidgetCourse() {
    Data data = Data();
    data.filterCourse.insert(0, {'name': 'All', 'isChecked': false});
    return Column(
      children: data.filterCourse.map((courses) {
        return CheckboxListTile(
            value: courses["isChecked"],
            title: Text(courses["name"]),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (newValue) {});
      }).toList(),
    );
  }

  void display({required String type, String? val}) {
    log(type);
    log(val!);
  }

  void _handleRadioValueChange(String? value) {
    log(value!);
  }
}
