import 'package:flutter/material.dart';
import 'package:sfp_mobile_interface_flutter/models/steel_model.dart';

const Duration threeHundredMilliSec = Duration(milliseconds: 300);
const Duration oneSec = Duration(seconds: 1);

const Color mainColor = Color.fromRGBO(153, 231, 222, 1);

const EdgeInsets padding20All = EdgeInsets.all(20);

Color semiGreyColor = Colors.white.withOpacity(0.2);

class Period {
  final String year;
  final String month;
  final String date;
  Period(this.year, this.month, this.date);

  static Period fromDateTime(DateTime dateTime) {
    return Period(
      dateTime.year.toString(),
      dateTime.month.toString(),
      dateTime.day.toString(),
    );
  }

  @override
  String toString() {
    return "$year / $month / $date";
  }
}
