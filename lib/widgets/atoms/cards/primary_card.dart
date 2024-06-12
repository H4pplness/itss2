import 'package:flutter/material.dart';

class PrimaryCard extends StatefulWidget {
  void Function()? onTap;
  Widget child;
  double? width;
  Color? backGroundColor;
  double? height;
  PrimaryCard(
      {Key? key,
      this.onTap,
      required this.child,
      this.height,
      this.width,
      this.backGroundColor})
      : super(key: key);

  @override
  State<PrimaryCard> createState() => _PrimaryCardState();
}

class _PrimaryCardState extends State<PrimaryCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          height: widget.height,
          width: widget.width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: widget.backGroundColor ??
                  Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10)),
          child: widget.child),
    );
  }
}
