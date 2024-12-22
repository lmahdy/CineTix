// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class SeatMapSolution extends StatefulWidget {
  const SeatMapSolution({
    super.key,
    this.width,
    this.height,
    this.seatRows = 10,
    this.seatColumns = 10,
    this.seatSize = 25,
    this.gapBetweenCategories = 30,
    this.seatCategories,
    this.isDarkMode,
    this.unavailableSeats,
    this.fontColor,
    this.seatThemeColor,
    required this.noOfTickets,
  });

  final double? width;
  final double? height;
  final int? seatRows;
  final int? seatColumns;
  final double? seatSize;
  final double? gapBetweenCategories;
  final List<SeatCategoriesDetailsStruct>? seatCategories;
  final bool? isDarkMode;
  final List<String>? unavailableSeats;
  final Color? fontColor;
  final Color? seatThemeColor;
  final int noOfTickets;

  @override
  State<SeatMapSolution> createState() => _SeatMapSolutionState();
}

class _SeatMapSolutionState extends State<SeatMapSolution> {
  final Set<String> _selectedSeats = {}; // Track selected seats
// 1ST PART
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      minScale: 0.5, //Default minimum you can zoom
      maxScale: 4.0, // default....max...
      child: Flexible(
        child: Container(
          width: widget.width,
          height: widget.height,
          color: widget.isDarkMode! ? Colors.transparent : Colors.transparent,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      _buildScreenArc(), // Build the arc representing the screen
                      const Text(
                        'Screen',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Loop through each seat category to build the seat rows
                  for (var categoryIndex = 0;
                      categoryIndex < widget.seatCategories!.length;
                      categoryIndex++)
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${widget.seatCategories![categoryIndex].categoryOfSeat} - \$${widget.seatCategories![categoryIndex].seatPrice.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: widget.isDarkMode!
                                    ? (widget.fontColor ?? Colors.black)
                                    : (widget.fontColor ?? Colors.black),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Loop through each row in the current category
                        for (int rowIndex = 0;
                            rowIndex <
                                (widget.seatCategories![categoryIndex]
                                            .seatCount! /
                                        widget.seatColumns!)
                                    .ceil();
                            rowIndex++)
                          Padding(
                            padding:
                                EdgeInsets.only(bottom: widget.seatSize! / 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Row label on the left
                                Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Text(
                                    _getRowLabel(categoryIndex, rowIndex),
                                    style: TextStyle(
                                      fontSize: widget.seatSize! / 2,
                                      fontWeight: FontWeight.normal,
                                      color: widget.isDarkMode!
                                          ? (widget.fontColor ?? Colors.black)
                                          : (widget.fontColor ?? Colors.black),
                                    ),
                                  ),
                                ),
                                // Build each seat in the row
                                for (int colIndex = 0;
                                    colIndex < widget.seatColumns!;
                                    colIndex++)
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.0),
                                    child: _buildSeat(
                                        categoryIndex, rowIndex, colIndex),
                                  ),
                                // Row label on the right
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    _getRowLabel(categoryIndex, rowIndex),
                                    style: TextStyle(
                                      fontSize: widget.seatSize! / 2,
                                      fontWeight: FontWeight.normal,
                                      color: widget.isDarkMode!
                                          ? (widget.fontColor ?? Colors.black)
                                          : (widget.fontColor ?? Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        SizedBox(height: widget.gapBetweenCategories!),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //2ND PART
  // Method to build individual seat widget
  Widget _buildSeat(int categoryIndex, int row, int col) {
    String seatName =
        '${_getRowLabel(categoryIndex, row)}${col + 1}'; // Generate seat label (e.g., A1, B2)
    bool isSelected =
        _selectedSeats.contains(seatName); // Check if seat is selected
    bool isAvailable = !widget.unavailableSeats!
        .contains(seatName); // Check if seat is available

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          setState(() {
            if (isSelected) {
              _selectedSeats.remove(seatName);
            } else {
              // Ensure the selected seats do not exceed the ticket limit
              if (_selectedSeats.length < widget.noOfTickets) {
                _selectedSeats.add(seatName);
              }
            }

            // Update the global state with the selected seats
            FFAppState().update(() {
              FFAppState().bookedSeats = _selectedSeats.toList();
            });
          });
        }
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 18.0, // Minimum width for the seat
          minHeight: 18.0, // Minimum height for the seat
        ),
        child: Container(
          width: widget.seatSize,
          height: widget.seatSize,
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.green // Green when selected
                : (isAvailable
                    ? Colors.transparent // Transparent when available
                    : (widget.seatThemeColor ??
                        Colors.orange)), // Orange when unavailable
            border: Border.all(
              color:
                  (widget.seatThemeColor ?? Colors.orange), // Seat border color
              width: 1.0, // Seat border width
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
            ), // Seat shape with rounded tops and flat bottom
          ),
          child: Center(
            child: Text(
              seatName,
              style: TextStyle(
                color: widget.isDarkMode!
                    ? (widget.fontColor ?? Colors.black)
                    : (widget.fontColor ?? Colors.black),
                fontWeight: FontWeight.normal,
                fontSize:
                    widget.seatSize! / 3, // Font size relative to seat size
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Method to generate row label (A, B, C, ... AA, BB, etc.)
  String _getRowLabel(int categoryIndex, int rowIndex) {
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    int totalRowsBeforeCategory = widget.seatCategories!
        .take(categoryIndex)
        .fold<int>(0,
            (sum, cat) => sum + (cat.seatCount! / widget.seatColumns!).ceil());
    int row = totalRowsBeforeCategory + rowIndex;

    if (row < alphabet.length) {
      return alphabet[
          row]; // Return single-letter label if within alphabet length
    } else {
      int firstLetterIndex = (row ~/ alphabet.length) - 1;
      int secondLetterIndex = row % alphabet.length;
      return '${alphabet[firstLetterIndex]}${alphabet[secondLetterIndex]}'; // Return double-letter label (e.g., AA, AB)
    }
  }

  // Method to build the arc representing the screen
  Widget _buildScreenArc() {
    return CustomPaint(
      size: Size(widget.width!, widget.height! * 0.1),
      painter: ScreenArcPainter(
        color: widget.isDarkMode! ? Colors.grey[800]! : Colors.grey[300]!,
      ),
    );
  }
}

// Custom Painter class for drawing the screen arc
class ScreenArcPainter extends CustomPainter {
  final Color color;

  ScreenArcPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0; // Set the width of the arc

    Path path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, 0, size.width, size.height);

    canvas.drawPath(path, paint); // Drawing the arc
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Repaint only if the delegate changes
  }
}
