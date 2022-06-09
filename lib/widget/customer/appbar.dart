import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mefood/themes/theme.dart';

class DriverStatus extends StatelessWidget {
  final Function()? onTap;

  const DriverStatus({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Ready for Ridder',
              style: TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: offsetXSm),
            Row(
              children: [
                Text(
                  'Away',
                  style: TextStyle(fontSize: 14.0),
                ),
                const SizedBox(
                  width: offsetSm,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DriverCalendar extends StatelessWidget {
  final Function()? onNext;
  final Function()? onPrevious;
  final Function()? onDatePicker;
  const DriverCalendar({
    Key? key,
    this.onNext,
    this.onPrevious,
    this.onDatePicker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          InkWell(
            onTap: onPrevious,
            child: SvgPicture.asset(
              'assets/icons/ic_back.svg',
              width: 18.0,
              height: 18.0,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          InkWell(
            onTap: onDatePicker,
            child: SvgPicture.asset(
              'assets/icons/ic_calendar.svg',
              width: 18.0,
              height: 18.0,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          InkWell(
            onTap: onNext,
            child: SvgPicture.asset(
              'assets/icons/ic_next.svg',
              width: 18.0,
              height: 18.0,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
        ],
      ),
    );
  }
}
