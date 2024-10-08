import 'package:flutter/material.dart';

import 'app_colors.dart';

class TimeSeatWidget extends StatefulWidget {
  final String time;
  final int seats;

  const TimeSeatWidget({
    super.key,
    required this.time,
    required this.seats,
  });

  @override
  _TimeSeatWidgetState createState() => _TimeSeatWidgetState();
}

class _TimeSeatWidgetState extends State<TimeSeatWidget> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
      },
      child: Container(
        width: 100,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isTapped ? AppColor.primaryColor : const Color.fromRGBO(214, 239, 233, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.time,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isTapped ? Colors.white : Colors.black, // Change text color based on tapped state
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Seats: ${widget.seats}',
                style: TextStyle(
                  fontSize: 14,
                  color: isTapped ? Colors.white : Colors.black, // Change text color based on tapped state
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
