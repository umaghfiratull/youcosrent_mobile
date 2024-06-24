import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cosplay_rental/utils/collor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../controllers/testing_controller.dart';

class TestingView extends GetView<TestingController> {
  const TestingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyDatePicker();
  }
}

class MyDatePicker extends StatefulWidget {
  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  DateRangePickerController _controller = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now(); // Dapatkan tanggal hari ini

    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            controller: _controller,
            onSelectionChanged: _onSelectionChanged,
            minDate: DateTime(
                today.year, today.month, today.day), // Set tanggal minimum
          ),
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      DateTime? startDate = args.value.startDate;
      DateTime? endDate = args.value.endDate;

      // Formatter untuk mengubah DateTime menjadi string dengan format YYYY-MM-DD
      final DateFormat formatter = DateFormat('yyyy-MM-dd');

      if (startDate != null && endDate != null) {
        // Format tanggal menggunakan DateFormat
        String formattedStartDate = formatter.format(startDate);
        String formattedEndDate = formatter.format(endDate);
        print('Range selected: From $formattedStartDate to $formattedEndDate');
      } else {
        print('Please complete the date range selection.');
      }
    }
  }
}
