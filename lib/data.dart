class Data {
  String filterStatusValue = 'All';
  String filterTypeValue = 'All';
  List<String> filterStatus = [
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
    'Open Assignment',
  ];

  List<Map> filterCourse = [
    {'name': 'Effective Communication level 1 - Section A', 'isChecked': false},
    {
      'name': 'Data Structure and Algorithm DSA - Section A',
      'isChecked': false
    },
    {'name': 'FM Proctoring Exam - Section A', 'isChecked': false},
  ];
}
