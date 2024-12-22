import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime? nextmonth(DateTime current) {
  return current.add(Duration(days: 30));
}

DateTime? previousmonth(DateTime current) {
  return current.subtract(Duration(days: 30));
}

List<DateTime>? months(DateTime? current) {
  if (current == null) {
    return null;
  }

  List<DateTime> monthDays = [];

  // Get the first day of the current month
  DateTime firstDay = DateTime(current.year, current.month, 1);

  // Get the last day of the current month
  DateTime lastDay = DateTime(current.year, current.month + 1, 0);

  // Get the weekday of the first day of the month
  int startWeekday = firstDay.weekday;

  // Get the total number of days in the month
  int totalDays = lastDay.day;

  // Calculate the number of days to display from the previous month
  int prevMonthDays = startWeekday - 1;

  // Get the last day of the previous month
  DateTime prevLastDay = DateTime(current.year, current.month, 0);

  // Add the days from the previous month to the list
  for (int i = prevLastDay.day - prevMonthDays + 1; i <= prevLastDay.day; i++) {
    monthDays.add(DateTime(current.year, current.month - 1, i));
  }

  // Add the days from the current month to the list
  for (int i = 1; i <= totalDays; i++) {
    monthDays.add(DateTime(current.year, current.month, i));
  }

  // Calculate the number of days to display from the next month
  int nextMonthDays = 42 - monthDays.length;

  // Add the days from the next month to the list
  for (int i = 1; i <= nextMonthDays; i++) {
    monthDays.add(DateTime(current.year, current.month + 1, i));
  }

  return monthDays;
}

List<String>? mergeBookedSeats(
  List<String>? firebaseList,
  List<String>? appStateList,
) {
  final combinedSet = {...?firebaseList, ...?appStateList};
  return combinedSet.toList();
}
