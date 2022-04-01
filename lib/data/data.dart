class Data {
  List<String> filterStatus = [
    'All',
    'Submitted',
    'Not Submitted',
    'Over Due',
    'Graded',
    'Checked',
    'Returned',
    'Re-sbimmted',
    'Late Submitted',
  ];
  List<String> filterType = [
    'All',
    'Open Assignment',
  ];

  List<Map> filterCourse = [
    {'name':'All','isChecked':false},
    {'name': 'Effective Communication level 1 - Section A', 'isChecked': false},
    {
      'name': 'Data Structure and Algorithm DSA - Section A',
      'isChecked': false
    },
    {'name': 'FM Proctoring Exam - Section A', 'isChecked': false},
  ];
}
