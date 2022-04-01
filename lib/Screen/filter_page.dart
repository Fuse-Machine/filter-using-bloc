import 'package:filter_bloc/bloc/filter_bloc.dart';
import 'package:filter_bloc/widgets/bottom_navigation_bar.dart';
import 'package:filter_bloc/widgets/widget.dart';
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
      bottomNavigationBar: const BottomNavigationbar(),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _wigetHeaderContainer(heading: 'Status'),
                    const WidgetRadiobuttonStatus(),
                    _wigetHeaderContainer(heading: 'Type'),
                    const WidgetRadiobuttonType(),
                    _wigetHeaderContainer(heading: 'Courses'),
                    const WidgetCheckboxCourse(),
                  ],
                ),

                //
              ],
            ),
          )),
          _widgetBottomOption(context),
        ],
      ),
    );
  }

  _wigetHeaderContainer({required String heading}) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.grey[400],
      child: Text(
        heading,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  _widgetBottomOption(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 65,
      color: const Color.fromARGB(255, 247, 233, 233),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              BlocProvider.of<FilterBloc>(context).add(Clear());
              //initail State
            },
            child: const Text(
              'Clear All',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(width: 15),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<FilterBloc>(context).add(Apply(context: context));
              
            },
            child: const Text(
              'Apply',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
