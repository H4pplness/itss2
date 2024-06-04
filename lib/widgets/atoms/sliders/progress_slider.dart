import 'package:flutter/material.dart';

class ProgressSlider extends StatefulWidget {
  double progress;
  double width;
  double borderRadius;
  double height;
  ProgressSlider({Key? key, required this.progress,required this.width,this.borderRadius = 5,this.height = 13}) : super(key: key);

  @override
  State<ProgressSlider> createState() => _ProgressSliderState();
}

class _ProgressSliderState extends State<ProgressSlider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: widget.width*widget.progress ,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
