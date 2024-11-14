library number_picker;

import 'package:flutter/material.dart';

class NumberPicker extends StatefulWidget {
  Color backgroundColor;
  Color borderColor;
  Color textColor;
  Color iconColor;
  Color buttonColor;
  double borderRadius;
  int maxValue;
  int minValue;
  int initialValue;
  int step;
  final Function(int value)? onValueChange;

  NumberPicker({
    super.key,
    this.backgroundColor = Colors.grey,
    this.borderColor = Colors.grey,
    this.textColor = Colors.black,
    this.iconColor = Colors.black,
    this.buttonColor = Colors.lightBlueAccent,
    this.borderRadius = 0.0,
    this.maxValue = 1000,
    this.minValue = -1000,
    this.initialValue = 0,
    this.step = 1,
    this.onValueChange,
  });

  @override
  _NumberPickerState createState() => _NumberPickerState();

}

class _NumberPickerState extends State<NumberPicker> {
  late int number;

  @override
  void initState() {
    super.initState();
    number = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: widget.buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(widget.borderRadius),
                    bottomLeft: Radius.circular(widget.borderRadius),
                  )
              )
          ),
          onPressed: (){
            setState(() {
              if(number > widget.minValue)
                number -= widget.step;
            });
            widget.onValueChange?.call(number);
          },
          child: Icon(Icons.arrow_downward, color: widget.iconColor),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              border: Border.all(
                color: widget.borderColor!,
                width: 3,
              ),
            ),
            child: Text(
              '$number',
              style: TextStyle(
                color: widget.textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: widget.buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(widget.borderRadius),
                    bottomRight: Radius.circular(widget.borderRadius),
                  )
              )
          ),
          onPressed: (){
            setState(() {
              if(number < widget.maxValue)
                number += widget.step;
            });
            widget.onValueChange?.call(number);
          },
          child: Icon(Icons.arrow_upward, color: widget.iconColor),
        ),
      ],
    );
  }


}