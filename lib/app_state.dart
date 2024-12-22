import 'package:flutter/material.dart';
import '/backend/backend.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _unavailableSeats = [];
  List<String> get unavailableSeats => _unavailableSeats;
  set unavailableSeats(List<String> value) {
    _unavailableSeats = value;
  }

  void addToUnavailableSeats(String value) {
    unavailableSeats.add(value);
  }

  void removeFromUnavailableSeats(String value) {
    unavailableSeats.remove(value);
  }

  void removeAtIndexFromUnavailableSeats(int index) {
    unavailableSeats.removeAt(index);
  }

  void updateUnavailableSeatsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    unavailableSeats[index] = updateFn(_unavailableSeats[index]);
  }

  void insertAtIndexInUnavailableSeats(int index, String value) {
    unavailableSeats.insert(index, value);
  }

  int _noOfTickets = 3;
  int get noOfTickets => _noOfTickets;
  set noOfTickets(int value) {
    _noOfTickets = value;
  }

  List<String> _bookedSeats = [];
  List<String> get bookedSeats => _bookedSeats;
  set bookedSeats(List<String> value) {
    _bookedSeats = value;
  }

  void addToBookedSeats(String value) {
    bookedSeats.add(value);
  }

  void removeFromBookedSeats(String value) {
    bookedSeats.remove(value);
  }

  void removeAtIndexFromBookedSeats(int index) {
    bookedSeats.removeAt(index);
  }

  void updateBookedSeatsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    bookedSeats[index] = updateFn(_bookedSeats[index]);
  }

  void insertAtIndexInBookedSeats(int index, String value) {
    bookedSeats.insert(index, value);
  }

  List<SeatCategoriesDetailsStruct> _seatCategories = [];
  List<SeatCategoriesDetailsStruct> get seatCategories => _seatCategories;
  set seatCategories(List<SeatCategoriesDetailsStruct> value) {
    _seatCategories = value;
  }

  void addToSeatCategories(SeatCategoriesDetailsStruct value) {
    seatCategories.add(value);
  }

  void removeFromSeatCategories(SeatCategoriesDetailsStruct value) {
    seatCategories.remove(value);
  }

  void removeAtIndexFromSeatCategories(int index) {
    seatCategories.removeAt(index);
  }

  void updateSeatCategoriesAtIndex(
    int index,
    SeatCategoriesDetailsStruct Function(SeatCategoriesDetailsStruct) updateFn,
  ) {
    seatCategories[index] = updateFn(_seatCategories[index]);
  }

  void insertAtIndexInSeatCategories(
      int index, SeatCategoriesDetailsStruct value) {
    seatCategories.insert(index, value);
  }

  List<String> _images = [];
  List<String> get images => _images;
  set images(List<String> value) {
    _images = value;
  }

  void addToImages(String value) {
    images.add(value);
  }

  void removeFromImages(String value) {
    images.remove(value);
  }

  void removeAtIndexFromImages(int index) {
    images.removeAt(index);
  }

  void updateImagesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    images[index] = updateFn(_images[index]);
  }

  void insertAtIndexInImages(int index, String value) {
    images.insert(index, value);
  }

  SeatCategoriesDetailsStruct _seatCategoryVariable =
      SeatCategoriesDetailsStruct();
  SeatCategoriesDetailsStruct get seatCategoryVariable => _seatCategoryVariable;
  set seatCategoryVariable(SeatCategoriesDetailsStruct value) {
    _seatCategoryVariable = value;
  }

  void updateSeatCategoryVariableStruct(
      Function(SeatCategoriesDetailsStruct) updateFn) {
    updateFn(_seatCategoryVariable);
  }

  DocumentReference? _sallerefrr =
      FirebaseFirestore.instance.doc('/sallle/9F2MMuHKfTM7uESunCDW');
  DocumentReference? get sallerefrr => _sallerefrr;
  set sallerefrr(DocumentReference? value) {
    _sallerefrr = value;
  }

  List<String> _filmim = [];
  List<String> get filmim => _filmim;
  set filmim(List<String> value) {
    _filmim = value;
  }

  void addToFilmim(String value) {
    filmim.add(value);
  }

  void removeFromFilmim(String value) {
    filmim.remove(value);
  }

  void removeAtIndexFromFilmim(int index) {
    filmim.removeAt(index);
  }

  void updateFilmimAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    filmim[index] = updateFn(_filmim[index]);
  }

  void insertAtIndexInFilmim(int index, String value) {
    filmim.insert(index, value);
  }

  bool _notificationseen = false;
  bool get notificationseen => _notificationseen;
  set notificationseen(bool value) {
    _notificationseen = value;
  }

  String _photoUrl = '';
  String get photoUrl => _photoUrl;
  set photoUrl(String value) {
    _photoUrl = value;
  }

  bool _search = false;
  bool get search => _search;
  set search(bool value) {
    _search = value;
  }

  String _TypeEV = 'evenement';
  String get TypeEV => _TypeEV;
  set TypeEV(String value) {
    _TypeEV = value;
  }
}
