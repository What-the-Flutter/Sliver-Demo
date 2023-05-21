import 'package:flutter/material.dart';

class FasterBouncingScrollPhysics extends BouncingScrollPhysics {
  const FasterBouncingScrollPhysics({ScrollPhysics? parent})
      : super(parent: parent);

  @override
  FasterBouncingScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return FasterBouncingScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    // The value of the scroll speed beyond the border of the content.
    // You can set the desired one yourself, simply by changing this value.
    const overscrollOutOfRangeSpeed = 2.5;

    final overscroll = offset.abs() * overscrollOutOfRangeSpeed;

    if (position.outOfRange) {
      return offset.sign == position.extentAfter.sign
          ? super.applyPhysicsToUserOffset(position, offset.sign * overscroll)
          : super.applyPhysicsToUserOffset(position, offset);
    } else {
      return super.applyPhysicsToUserOffset(position, offset);
    }
  }
}
